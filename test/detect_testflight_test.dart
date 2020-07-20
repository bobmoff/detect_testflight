import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:detect_testflight/detect_testflight.dart';

void main() {
  const MethodChannel channel = MethodChannel('detect_testflight');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return false;
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await DetectTestflight.isTestflight, false);
  });
}
