import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:bidsystem/constants/backend_host.dart';
import 'package:bidsystem/constants/controllers.dart';
import 'package:bidsystem/helpers/message_parse.dart';
import 'package:bidsystem/routing/routes.dart';
import 'package:bidsystem/state/user_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController with StateMixin {
  static UserController instance = Get.find();

  final UserState myState = UserState();

  final failed = false.obs;
  final errorMessage = "".obs;

  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final repasswordController = TextEditingController();

  final isSeller = false.obs;

  final UserState viewInfoState = UserState();

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.success());
  }

  Future<String> register() async {
    failed.value = false;

    final tempState = UserState();
    tempState.email.value = emailController.text;
    tempState.username.value = usernameController.text;
    tempState.phone.value =
        phoneController.text.replaceAll(RegExp(r'/((\+\d{1,3})|[^\d])/g'), '');

    tempState.role.value = isSeller.value ? "SELLER" : "BIDDER";

    final body = tempState.toJson();
    body.putIfAbsent("password", () => passwordController.text);

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    change(null, status: RxStatus.loading());
    final response = await http.post(
        Uri.parse(BackendHost + "/api/v1/users/register"),
        headers: requestHeaders,
        body: jsonEncode(body));

    if (response.statusCode == HttpStatus.created) {
      // login and create session here
      login();
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

  Future<String> login() async {
    failed.value = false;

    final body = Map<String, dynamic>();
    body.putIfAbsent("email", () => emailController.text);
    body.putIfAbsent("password", () => passwordController.text);

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    change(null, status: RxStatus.loading());
    final response = await http.post(
        Uri.parse(BackendHost + "/api/v1/users/login"),
        headers: requestHeaders,
        body: jsonEncode(body));

    if (response.statusCode == HttpStatus.ok) {
      // Update State here
      myState.updateFromJson(jsonDecode(response.body));
      navigationController.navigateTo(HomePageRoute);
      change(null, status: RxStatus.success());
      return parseMessage(response.body);
    } else {
      failed.value = true;
      errorMessage.value = parseMessage(response.body);
      change(null, status: RxStatus.success());
      return parseMessage(response.body);
    }
  }

  Future<String> getUser(int id) async {
    failed.value = false;
    viewInfoState.dispose();

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    change(null, status: RxStatus.loading());
    final response = await http.get(Uri.parse(BackendHost + "/api/v1/users/users/" + id.toString()),
        headers: requestHeaders);
    print(response.body);

    if (response.statusCode == HttpStatus.ok) {
      viewInfoState.updateFromJson(jsonDecode(response.body));
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
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
    usernameController.clear();
    repasswordController.clear();
  }

  logOut() {
    myState.dispose();
    _clearController();
    navigationController.navigateTo(HomePageRoute);
  }

}
