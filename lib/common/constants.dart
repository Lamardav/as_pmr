import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_device_type/flutter_device_type.dart';


class Constants {
  static final bool isAndroid = Platform.isAndroid;
  static final bool isIos = Platform.isIOS;
  static final bool isIphoneX = Device.get().isIphoneX;
  static const int gridSize = 8;
  static double getFigmaSize(BuildContext context, int size) => MediaQuery.of(context).size.width / 375 * size;
  static const authDeviceClientId = 'mobile.device';
  static const authUserClientId = 'mobile.client';
}