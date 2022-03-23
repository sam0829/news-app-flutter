import 'package:flutter/foundation.dart';

class LogUtils {
  static const _kDefaultTag = 'NewsApp::LogUtils';

  static void log(String message, {String? tag}) {
    if (kDebugMode) {
      print('${(tag ?? _kDefaultTag)} - $message');
    }
  }
}
