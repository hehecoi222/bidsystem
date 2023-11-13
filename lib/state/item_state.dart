
import 'package:get/get.dart';

class ItemState {
  final name = "".obs;
  final id = (-1).obs;
  final description = "".obs;
  final status = "".obs;

  ItemState();

  ItemState.fromJson(Map<String, dynamic> json) {
    updateFromJson(json);
  }

  updateFromJson(Map<String, dynamic> json) {
    id.value = json['id'];
    name.value = json['name'];
    description.value = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name.value;
    data['description'] = this.description.value;
    data['age'] = 0;
    data['origin'] = "empty";
    data['material'] = "empty";
    return data;
  }

  dispose() {
    id.value = -1;
    name.value = "";
    description.value = "";
  }
}