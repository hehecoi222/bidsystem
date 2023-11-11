import 'package:bidsystem/pages/item/routing/routes.dart';
import 'package:bidsystem/pages/item/widgets/add_to_cart_success.dart';
import 'package:bidsystem/pages/item/widgets/bid_info.dart';
import 'package:bidsystem/pages/item/widgets/receipt.dart';
import 'package:bidsystem/widgets/cutom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog extends StatelessWidget {
  CustomDialog({super.key});

  final _navigationKey = GlobalKey<NavigatorState>();

  final _currentPage = PlaceBidStartInfoCard.obs;
  final _nextActionText = "Next".obs;
  final _backActionText = "Cancel".obs;

  void _onPlaceBidComplete() {
    _backActionText.value = "Back";
    _nextActionText.value = "Confirm";
    _currentPage.value = PlaceBidReviewReceiptCard;
    _navigationKey.currentState!.pushNamed(PlaceBidReviewReceiptCard);
  }

  void _onConfirm() {
    _nextActionText.value = "Done";
    _currentPage.value = PlaceBidProgressCard;
    _navigationKey.currentState!.pushNamed(PlaceBidProgressCard);
  }

  void _getNext(BuildContext context) {
    switch (_currentPage.value) {
      case PlaceBidStartInfoCard:
        _onPlaceBidComplete();
      case PlaceBidReviewReceiptCard: {
        _onConfirm();
      }
      case PlaceBidProgressCard: {
        _currentPage.value = PlaceBidStartInfoCard;
        Navigator.pop(context, "complete");
      }
      default:
        _onPlaceBidComplete();
    }
  }

  void _getBack(BuildContext context) {
    switch (_currentPage.value) {
      case PlaceBidStartInfoCard:
        Navigator.pop(context, "cancel");
      case PlaceBidReviewReceiptCard: {
        _backActionText.value = "Cancel";
        _nextActionText.value = "Next";
        _currentPage.value = PlaceBidStartInfoCard;
        _navigationKey.currentState?.pop(PlaceBidReviewReceiptCard);
      }
      default:
        Navigator.pop(context, "cancel");
    }
  }

  Route _onGenerateRoute(RouteSettings settings) {
    late Widget page;
    switch (settings.name) {
      case PlaceBidStartInfoCard:
        page = DialogInfo();
      case PlaceBidReviewReceiptCard:
        page = Receipt();
      case PlaceBidProgressCard:
        page = AddToCartDone();
      default:
        page = DialogInfo();
    }
    return MaterialPageRoute(builder: (context) => page, settings: settings);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return AlertDialog(
      title: CustomText(
        text: "Place bid",
        textStyle: Theme.of(context).textTheme.headlineSmall,
      ),
      content: Container(
        child: WillPopScope(
          child: Navigator(
            onGenerateRoute: _onGenerateRoute,
            key: _navigationKey,
            initialRoute: PlaceBidStartInfoCard,
          ),
          onWillPop: () {
            _navigationKey.currentState?.pop();
            return Future(() => true);
          },
        ),
        width: width * 0.8,
        height: 600,
      ),
      actions: [
        Obx(() => Visibility(child: TextButton(
          onPressed: () => _getBack(context),
          child: Text(_backActionText.value),
        ), visible: _currentPage.value != PlaceBidProgressCard,)),
        TextButton(
          onPressed: () => _getNext(context),
          child: Obx(() => Text(_nextActionText.value)),
        ),
      ],
    );
  }
}
