import 'package:flutter/foundation.dart';

class LoggerFactory {
  static void getLogger(dynamic logs) {
    if (kDebugMode) {
      print(logs);
    }
  }
}
