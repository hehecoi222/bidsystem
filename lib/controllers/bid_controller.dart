import 'dart:convert';
import 'dart:html';

import 'package:bidsystem/constants/backend_host.dart';
import 'package:bidsystem/state/bid_state.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constants/controllers.dart';
import '../helpers/message_parse.dart';

class BidController extends GetxController with StateMixin {
  static BidController instance = Get.find();

  final currentBid = BidState();

  final failed = false.obs;
  final errorMessage = "".obs;

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.success());
  }

  Future<String> getBid(int id) async {
    failed.value = false;
    currentBid.dispose();

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    change(null, status: RxStatus.loading());
    final response = await http.get(
        Uri.parse(BackendHost + "/api/v1/items/" + id.toString()),
        headers: requestHeaders);

    if (response.statusCode == HttpStatus.ok) {
      currentBid.updateFromJson(jsonDecode(response.body));
      change(null, status: RxStatus.success());
      return parseMessage(response.body);
    } else {
      change(null, status: RxStatus.success());
      failed.value = true;
      errorMessage.value = parseMessage(response.body);
      return parseMessage(response.body);
    }
  }

  Future<String> postBid() async {
    failed.value = false;
    currentBid.dispose();

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    currentBid.price.value = int.parse(
        auctionController.nextPrice.text.replaceAll(RegExp(r' '), ''));
    currentBid.timestamp.value = DateTime.now().toIso8601String() + "Z";
    final body = jsonEncode(currentBid.toJson());
    change(null, status: RxStatus.loading());
    final response = await http.post(
        Uri.parse(BackendHost +
            "/bidders/" +
            userController.myState.id.value.toString() +
            "/auctions/" +
            auctionController.currentAuction.id.value.toString() +
            "/bid"),
        headers: requestHeaders, body: body);
    print(response.body);

    if (response.statusCode == HttpStatus.ok) {
      currentBid.dispose();
      change(null, status: RxStatus.success());
      return parseMessage(response.body);
    } else {
      change(null, status: RxStatus.success());
      failed.value = true;
      errorMessage.value = parseMessage(response.body);
      return parseMessage(response.body);
    }
  }
}
