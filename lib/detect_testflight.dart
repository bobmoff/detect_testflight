import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:io';

class DetectTestflight {
  static bool _isTestflightCache;

  static const MethodChannel _channel =
      const MethodChannel('detect_testflight');

  static Future<bool> _checkTestflight() async {
    if (Platform.isIOS) {
      final String isTestflight =
          await _channel.invokeMethod('getPlatformVersion');
      return isTestflight == "true";
    }

    return false;
  }

  static Future<bool> get isTestflight async {
    if (_isTestflightCache == null) {
      _isTestflightCache = await _checkTestflight();
    }

    return _isTestflightCache;
  }
}
