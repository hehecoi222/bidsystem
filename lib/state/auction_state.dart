import 'package:bidsystem/state/bid_state.dart';
import 'package:bidsystem/state/item_state.dart';
import 'package:bidsystem/state/user_state.dart';
import 'package:get/get.dart';

class AuctionState {
  final id = (-1).obs;
  final startingPrice = 0.obs;
  final item = ItemState().obs;
  final seller = UserState().obs;
  final startingTime = "".obs;
  final deadline = "".obs;
  final bids = <BidState>[].obs;
  final currentPrice = 0.obs;
  final minimumIncrease = 0.obs;

  AuctionState.fromJson(Map<String, dynamic> json) {
    updateFromJson(json);
  }

  updateFromJson(Map<String, dynamic> json) {
    id.value = json['id'];
    item.value.id.value = json['itemId'];
    seller.value.id.value = json['sellerId'];
    startingPrice.value = json['startingPrice'];
    final highestBid = json['highestBid'];
    currentPrice.value = highestBid == null
        ? startingPrice.value
        : BidState.fromJson(highestBid).price.value;
    startingTime.value = json['startingTime'];
    deadline.value = json['deadline'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemId'] = this.item.value.id.value;
    data['startingPrice'] = this.startingPrice.value;
    data['startingTime'] = this.startingTime.value;
    data['deadline'] = this.deadline.value;
    data['minimumIncrease'] = this.minimumIncrease.value;
    return data;
  }

  AuctionState();

  dispose() {
    id.value = -1;
    startingPrice.value = 0;
    item.value.dispose();
    seller.value.dispose();
    startingTime.value = "";
    deadline.value = "";
    bids.clear();
    currentPrice.value = 0;
    minimumIncrease.value = 0;
  }
}
