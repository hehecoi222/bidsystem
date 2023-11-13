import 'package:bidsystem/state/user_state.dart';
import 'package:get/get.dart';

class BidState {
  final id = (-1).obs;
  final timestamp = "".obs;
  final bidder = UserState().obs;
  final price = 0.obs;

  BidState();

  BidState.fromJson(Map<String, dynamic> json) {
    updateFromJson(json);
  }

  updateFromJson(Map<String, dynamic> json) {
    id.value = json['id'];
    price.value = json['price'];
    timestamp.value = json['timestamp'];
    if (json['bidder'] != null) {
      bidder.value = UserState.fromJson(json['bidder']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price.value;
    data['timestamp'] = this.timestamp.value;
    data['bidder'] = bidder.value.toJson();
    return data;
  }

  dispose() {
    id.value = -1;
    price.value = 0;
    timestamp.value = "";
    bidder.value.dispose();
  }
}