import 'dart:io';
import 'dart:ui';

double deviceHeight = PlatformDispatcher.instance.views.first.physicalSize.height; // small device height( 1920)
double deviceWidth = window.physicalSize.width; // small device width (1080.0)

class AppTextSize {
  static double minSmallTextSize = deviceWidth > 1000
      ? Platform.isIOS
          ? 10
          : 8
      : Platform.isIOS
          ? 12
          : 10;
  static double extraSmallTextSize = deviceWidth > 1000
      ? Platform.isIOS
          ? 12
          : 10
      : Platform.isIOS
          ? 14
          : 12;
  static double smallTextSize = deviceWidth > 1000
      ? Platform.isIOS
          ? 15
          : 12
      : Platform.isIOS
          ? 17
          : 14;
  static double idealTextSize = deviceWidth > 1000
      ? Platform.isIOS
          ? 18
          : 14
      : Platform.isIOS
          ? 18
          : 16;
  static double normalTextSize = deviceWidth > 1000
      ? Platform.isIOS
          ? 18
          : 16
      : Platform.isIOS
          ? 20
          : 18;
  static double mediumTextSize = deviceWidth > 1000
      ? Platform.isIOS
          ? 20
          : 18
      : Platform.isIOS
          ? 22
          : 20;
  static double largeTextSize = deviceWidth > 1000
      ? Platform.isIOS
          ? 22
          : 20
      : Platform.isIOS
          ? 24
          : 22;
  static double extraLargeTextSize = deviceWidth > 1000
      ? Platform.isIOS
          ? 26
          : 22
      : Platform.isIOS
          ? 26
          : 24;
  static double largeSize = deviceWidth > 1000
      ? Platform.isIOS
          ? 30
          : 28
      : Platform.isIOS
          ? 32
          : 30;
  static double headerText = deviceWidth > 1000
      ? Platform.isIOS
          ? 38
          : 36
      : Platform.isIOS
          ? 40
          : 38;
  static double extremeLargeTextSize = deviceWidth > 1000
      ? Platform.isIOS
          ? 40.0
          : 38
      : Platform.isIOS
          ? 42
          : 40;
}

double containerHeight = 50.0;
