import 'package:flutter/material.dart';

class AppTheme {
  static const fontFamily = 'poppins';

  static CardTheme getCardTheme(BuildContext context) {
    return Theme.of(context).cardTheme.copyWith(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: Colors.white,
        );
  }

  static TextTheme getTextTheme(BuildContext context) {
    return Theme.of(context).textTheme.copyWith(
          bodyText2: const TextStyle(
            color: Colors.black54,
          ),
        );
  }
}
