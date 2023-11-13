import 'package:flutter/material.dart';

Widget imageLoading(
    BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
  if (loadingProgress == null) return child;
  return Center(
    child: CircularProgressIndicator(
      value: loadingProgress.expectedTotalBytes != null
          ? loadingProgress.cumulativeBytesLoaded /
              loadingProgress.expectedTotalBytes!
          : null,
    ),
  );
}

Widget imageObject(
    BuildContext context, Object error, StackTrace? failureStack) {
  return Container();
}
