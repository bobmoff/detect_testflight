import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:io';

class DetectTestflight {
  /// Store the value of whether the app is in TestFlight, as this does not
  /// change in the same app run
  static bool? _isTestflightCache;

  /// Channel to communicate with native code
  static const MethodChannel _channel =
      const MethodChannel('detect_testflight');

  /// Private method to determine if current runtime is from TestFlight
  static Future<bool> _checkTestflight() async {
    if (Platform.isIOS) {
      final String isTestflight =
          await _channel.invokeMethod('getPlatformVersion');
      return isTestflight == "true";
    }

    return false;
  }

  /// Query whether the app is running from a Testflight build
  static Future<bool> get isTestflight async {
    _isTestflightCache ??= await _checkTestflight();
    return _isTestflightCache!;
  }
}
