// All the ontap functions of the app need to be call here to manage them easily.

import 'dart:io';
import 'package:flutter/services.dart';

class AppClickListener {
  static onAppExit() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    }
  }

  // two functions as demo
  /*
  static goToLoginScreen() {
    AuthMixin.setAuthScreenEnum = AuthEnum.signIn;
  }

  static onForgotPass({
    required AuthRequestModel authRequestModel,
  }) async {
    if (AppValidation.validateForgotPass(
      authRequestModel: authRequestModel,
    )) {
      AppStorageHelper.setUserEmail = authRequestModel.email;
      await AuthMixin.callForgotPass(
        authRequestModel: authRequestModel,
      );
    }
  }*/
}