import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:bidsystem/constants/backend_host.dart';
import 'package:bidsystem/constants/controllers.dart';
import 'package:bidsystem/helpers/time_parse.dart';
import 'package:bidsystem/state/auction_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../helpers/message_parse.dart';

class AuctionController extends GetxController with StateMixin {
  static AuctionController instance = Get.find();

  final listAuctionsPreview = <AuctionState>[].obs;
  final currentAuction = AuctionState();

  final failed = false.obs;
  final errorMessage = "".obs;

  final remainingTime = "".obs;
  final portion = (0.0).obs;

  final nextPrice = TextEditingController();

  final startDate = "".obs;
  final endDate = "".obs;

  final itemPrice = TextEditingController();
  final itemMinimum = TextEditingController();

  final searchTerm = TextEditingController();

  void loadRemainingTime() {
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (currentAuction.id.value < 0) {
        print("run");
        remainingTime.value = "";
        portion.value = 0;
        timer.cancel();
      } else {
        final tempPair = calculateRemaining(
            currentAuction.startingTime.value, currentAuction.deadline.value);
        remainingTime.value = tempPair.first;
        portion.value = tempPair.second;
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.success());
    getAllAuctions();
  }

  Future<String> getAllAuctions() async {
    failed.value = false;

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    change(null, status: RxStatus.loading());
    final response = await http.get(Uri.parse(BackendHost + "/api/v1/auctions"),
        headers: requestHeaders);

    if (response.statusCode == HttpStatus.ok) {
      jsonDecode(response.body).forEach((element) async {
        final tempState = AuctionState.fromJson(element);
        listAuctionsPreview.add(tempState);
        await itemController.getItem(tempState.id.value);
        tempState.item.value = itemController.currentItem;
      });
      change(null, status: RxStatus.success());
      return parseMessage(response.body);
    } else {
      change(null, status: RxStatus.success());
      failed.value = true;
      errorMessage.value = parseMessage(response.body);
      return parseMessage(response.body);
    }
  }

  Future<String> getAuction(int id) async {
    failed.value = false;
    currentAuction.dispose();
    nextPrice.text = "";
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    change(null, status: RxStatus.loading());
    final response = await http.get(
        Uri.parse(BackendHost + "/api/v1/auctions/" + id.toString()),
        headers: requestHeaders);

    if (response.statusCode == HttpStatus.ok) {
      currentAuction.updateFromJson(jsonDecode(response.body));
      await itemController.getItem(currentAuction.item.value.id.value);
      await userController.getUser(currentAuction.seller.value.id.value);
      currentAuction.item.value = itemController.currentItem;
      currentAuction.seller.value = userController.viewInfoState;
      nextPrice.text = (currentAuction.currentPrice.value +
              currentAuction.minimumIncrease.value)
          .toString();
      loadRemainingTime();
      change(null, status: RxStatus.success());
      return parseMessage(response.body);
    } else {
      change(null, status: RxStatus.success());
      failed.value = true;
      errorMessage.value = parseMessage(response.body);
      return parseMessage(response.body);
    }
  }

  Future<String> addAuction() async {
    failed.value = false;
    currentAuction.dispose();
    currentAuction.item.value.dispose();
    currentAuction.item.value = itemController.itemStateSelect.value;
    currentAuction.startingPrice.value = int.parse(itemPrice.text);
    currentAuction.minimumIncrease.value = int.parse(itemMinimum.text);
    currentAuction.startingTime.value = startDate.value;
    currentAuction.deadline.value = endDate.value;

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    var body = jsonEncode(currentAuction.toJson());
    print(body);

    change(null, status: RxStatus.loading());
    var response = await http.post(
        Uri.parse(BackendHost +
            "/api/v1/sellers/" +
            userController.myState.id.value.toString() +
            "/auctions"),
        body: body,
        headers: requestHeaders);

    print(response.body);

    if (response.statusCode == HttpStatus.ok) {
      body = """{
            "approve": true
        }""";
      response = await http.patch(
          Uri.parse(BackendHost +
              "/api/v1/auctions/" +
              currentAuction.id.value.toString() + "/approval"),
          body: body,
          headers: requestHeaders);
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        change(null, status: RxStatus.success());
        return parseMessage(response.body);
      } else {
        change(null, status: RxStatus.success());
        failed.value = true;
        errorMessage.value = parseMessage(response.body);
        return parseMessage(response.body);
      }
    } else {
      change(null, status: RxStatus.success());
      failed.value = true;
      errorMessage.value = parseMessage(response.body);
      return parseMessage(response.body);
    }
  }

  void multiply(double sum) {
    int current = int.parse(nextPrice.text.replaceAll(RegExp(r' '), ''));
    nextPrice.text = (current * sum).toInt().toString();
  }

  Future<String> registerBid() async {
    failed.value = false;

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    change(null, status: RxStatus.loading());
    final response = await http.post(
        Uri.parse(BackendHost +
            "/api/v1/bidders/" +
            userController.myState.id.value.toString() +
            "/auctions/" +
            currentAuction.id.value.toString() +
            "/register"),
        headers: requestHeaders);

    if (response.statusCode == HttpStatus.ok) {
      final responsed = await bidController.postBid();
      change(null, status: RxStatus.success());
      return parseMessage(responsed);
    } else {
      change(null, status: RxStatus.success());
      failed.value = true;
      errorMessage.value = parseMessage(response.body);
      return parseMessage(response.body);
    }
  }
}
