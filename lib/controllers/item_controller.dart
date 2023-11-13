import 'dart:convert';
import 'dart:html';

import 'package:bidsystem/constants/backend_host.dart';
import 'package:bidsystem/constants/controllers.dart';
import 'package:bidsystem/state/item_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../helpers/message_parse.dart';

class ItemController extends GetxController with StateMixin {
  static ItemController instance = Get.find();

  final currentItem = ItemState();
  final listAllItems = <ItemState>[].obs;

  final failed = false.obs;
  final errorMessage = "".obs;

  final itemName = TextEditingController();
  final itemDescription = TextEditingController();

  final itemSelect = TextEditingController();
  final itemStateSelect = ItemState().obs;

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.success());
  }

  Future<String> getItem(int id) async {
    failed.value = false;
    currentItem.dispose();

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    change(null, status: RxStatus.loading());
    final response = await http.get(
        Uri.parse(BackendHost + "/api/v1/items/" + id.toString()),
        headers: requestHeaders);

    if (response.statusCode == HttpStatus.ok) {
      currentItem.updateFromJson(jsonDecode(response.body));
      change(null, status: RxStatus.success());
      return parseMessage(response.body);
    } else {
      change(null, status: RxStatus.success());
      failed.value = true;
      errorMessage.value = parseMessage(response.body);
      return parseMessage(response.body);
    }
  }

  Future<String> getAllItem() async {
    failed.value = false;
    listAllItems.clear();

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    change(null, status: RxStatus.loading());
    final response = await http.get(
        Uri.parse(BackendHost +
            "/api/v1/sellers/" +
            userController.myState.id.value.toString() +
            "/items"),
        headers: requestHeaders);

    if (response.statusCode == HttpStatus.ok) {
      jsonDecode(response.body).forEach((element) async {
        final tempState = ItemState.fromJson(element);
        listAllItems.add(tempState);
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

  Future<String> addItem() async {
    failed.value = false;
    currentItem.dispose();
    currentItem.name.value = itemName.text;
    currentItem.description.value = itemDescription.text;

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final body = jsonEncode(currentItem.toJson());

    change(null, status: RxStatus.loading());
    final response = await http.post(
        Uri.parse(BackendHost +
            "/api/v1/sellers/" +
            userController.myState.id.value.toString() +
            "/items"),
        headers: requestHeaders,
        body: body);

    if (response.statusCode == HttpStatus.ok) {
      currentItem.updateFromJson(jsonDecode(response.body));
      itemStateSelect.value = currentItem;
      listAllItems.add(currentItem);
      itemStateSelect.refresh();
      _clearController();
      change(null, status: RxStatus.success());
      return parseMessage(response.body);
    } else {
      change(null, status: RxStatus.success());
      failed.value = true;
      errorMessage.value = parseMessage(response.body);
      return parseMessage(response.body);
    }
  }
  _clearController() {
    itemName.clear();
    itemDescription.clear();
  }
}
