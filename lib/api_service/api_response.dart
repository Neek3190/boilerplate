import 'dart:convert';

import 'package:boilerplate/utils/app_strings.dart';
import 'package:dio/dio.dart';

import '../helper/data_helper.dart';

class ApiResponse {
  ApiResponse(Response response){
    code = response.statusCode!;
    if(isSuccessful){
      body = response.data!;
      errorMessage = '';
    }else if (totallyNoRecord){
      body= null;
      errorMessage = AppStrings.noRecord ;
    } else{
      body = null;
      try{
        final dynamic hashMap = json.decode(response.data!);
        DataHelper.logValue("", hashMap['message']);
        errorMessage = hashMap['message'];
      }catch(error){
 DataHelper.logValue(
          "",
          AppStrings.timeoutError,
        );
        errorMessage = AppStrings.timeoutError;
      }
    }
  }

  int code = 0;
  dynamic body ;
  String errorMessage = '';

  bool get isSuccessful{
    return code == 200 || code == 201 ; // between 200 and 300
  }

  bool get totallyNoRecord{
    return code == 500 || code == 400 || code == 404;
  }

}