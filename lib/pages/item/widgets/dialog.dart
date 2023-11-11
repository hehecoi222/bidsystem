import 'package:bidsystem/pages/item/routing/routes.dart';
import 'package:bidsystem/pages/item/widgets/bid_info.dart';
import 'package:bidsystem/widgets/cutom_text.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  CustomDialog({super.key});

  final _navigationKey = GlobalKey<NavigatorState>();

  void _onPlaceBidComplete() {
    _navigationKey.currentState!.pushNamed(PlaceBidReviewReceiptCard);
  }

  void _onConfirm() {
    _navigationKey.currentState!.pushNamed(PlaceBidProgressCard);
  }

  Route _onGenerateRoute(RouteSettings settings) {
    late Widget page;
    switch (settings.name) {
      case PlaceBidStartInfoCard:
        page = DialogInfo();
      case PlaceBidReviewReceiptCard:
        page = Container();
      case PlaceBidProgressCard:
        page = Container();
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
        child: WillPopScope(child: Navigator(
          onGenerateRoute: _onGenerateRoute,
          key: _navigationKey,
          initialRoute: PlaceBidStartInfoCard,
        ), onWillPop: () {
          _navigationKey.currentState?.pop();
          return Future(() => true);
        },),
        width: width * 0.8,
        height: 600,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => _onPlaceBidComplete(),
          child: const Text('Next'),
        ),
      ],
    );
  }
}
