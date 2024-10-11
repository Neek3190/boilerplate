import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../utils/app_color.dart';
import '../utils/app_text_sizes.dart';

class DataHelper {
  static logValue(String key, dynamic value) {
    log("$key: $value");
  }

  static RxBool isLoading = false.obs;

  static void hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static showToast(String message) {
    Fluttertoast.showToast(
      msg: message.tr,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColor.themeColor,
      textColor: AppColor.white,
      fontSize: (AppTextSize.extraSmallTextSize - 1),
    );
  }

  static bool emailValidation(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static maxLength({required int length}) =>
      LengthLimitingTextInputFormatter(length);

  static allowOnlyNumber() => FilteringTextInputFormatter.digitsOnly;

  static allowWithDecimalNumber() =>
      FilteringTextInputFormatter.allow(RegExp("[0-9.]"));

  static denyWhiteSpace() => FilteringTextInputFormatter.deny(
        RegExp(r'\s'),
      );

  static allowSpaceWithChar() => FilteringTextInputFormatter.allow(
        RegExp("[a-zA-Z -]"),
      );

  static onlyCharacterWithSpace() => FilteringTextInputFormatter.allow(
        RegExp("[a-zA-Z ]"),
      );

  static allowSpaceWithCharWithoutHyphen() => FilteringTextInputFormatter.allow(
        RegExp("[a-zA-Z -]"),
      );

  static allowSpecialCharacterWithChar() => FilteringTextInputFormatter.allow(
      RegExp("[A-Za-z!@#\$%&'*+-/=?^_`{|}~ ]"));

  static allowSpecialCharacterWithCharNumber() =>
      FilteringTextInputFormatter.allow(
          RegExp("[A-Za-z0-9!@#\$%&'*+-/=?^_`{|}~ ]"));

  static allowCharacterWithCharNumber() =>
      FilteringTextInputFormatter.allow(RegExp("[A-Za-z0-9 ]"));

  static Future<bool> checkUserConnection() async {
    RxBool activeConnection = false.obs;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        activeConnection.value = true;
      }
    } on SocketException catch (_) {
      activeConnection.value = false;
    }
    return activeConnection.value;
  }
}