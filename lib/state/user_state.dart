import 'package:get/get.dart';

class UserState {
  final id = (-1).obs;
  final username = "".obs;
  final email = "".obs;
  final phone = "".obs;
  final enabled = true.obs;
  final role = "".obs;

  UserState();

  UserState.fromJson(Map<String, dynamic> json) {
    updateFromJson(json);
  }

  updateFromJson(Map<String, dynamic> json) {
    id.value = json["id"];
    username.value = json['username'];
    email.value = json['email'];
    phone.value = json['phone'];
    enabled.value = json['enabled'] == null ? true : json['enabled'];
    if (json.containsKey('itemInventory')) {
      role.value = 'seller';
    } else if (json.containsKey('cart')) {
      role.value = 'bidder';
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username.value;
    data['email'] = this.email.value;
    data['phone'] = this.phone.value;
    data['role'] = this.role.value;
    return data;
  }

  dispose() {
    id.value = -1;
    username.value = "";
    phone.value = "";
    email.value = "";
    enabled.value = false;
    role.value = "";
  }
}