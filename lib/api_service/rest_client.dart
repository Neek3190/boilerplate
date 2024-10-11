import 'dart:convert';
import 'dart:io';

import 'package:boilerplate/api_service/api_object.dart';
import 'package:boilerplate/api_service/api_resource.dart';
import 'package:boilerplate/api_service/api_response.dart';
import 'package:boilerplate/api_service/api_url.dart';
import 'package:boilerplate/helper/data_helper.dart';
import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

import '../utils/app_strings.dart';
import 'api_method.dart';

class RestClient extends GetxService {
  late Dio _dio;
  String aToken = '';

  static header() => {
        'Content-Type': 'application/json',
        //  "Access-Control-Allow-Credentials":
        //           true, // Required for cookies, authorization headers with HTTPS
        //       "Access-Control-Allow-Headers":
        //           "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        //       "Access-Control-Allow-Methods":
        //           "POST, OPTIONS, GET, PUT, DELETE, PATCH "
        // 'X-localization': AppStorageHelper.getLanguage.toString() ?? 'en',
      };

  // static headerToken() => {
  //   'Content-Type': 'application/json',
  //   'Accept-Language': AppStorageHelper.getLanguage == ""
  //       ? englishCode
  //       : AppStorageHelper.getLanguage,
  //   'authorization': AppStorageHelper.getUserToken,
  // };

  ApiResource<T> psObjectConvert<T>(dynamic dataList, T data) {
    return ApiResource<T>(dataList.status, dataList.message, data);
  }

  Future<RestClient> init() async {
    _dio = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl, headers: header()));
    initInterceptors();
    return this;
  }

  void initInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        DataHelper.logValue(
          "header",
          options.headers,
        );
        return handler.next(options);
      },
      onResponse: (response, handler) {
        DataHelper.logValue(
            "RESPONSE", '[${response.statusCode}] => DATA: ${response.data}');
        return handler.next(response);
      },
      onError: (error, handler) {
        DataHelper.logValue("ERROR", error);
        DataHelper.isLoading.value = false;
        return handler.next(error);
      },
    ));
  }

  Future<ApiResource<R>> request<T extends ApiObject<dynamic>, R>(
      T obj,
      String url,
      Method method,
      Map<String, dynamic> params,
      Map<String, dynamic> queryParams,
      FormData formData) async {
    Response response;
    init();
    String baseUrl = '';
    if (url.contains(ApiUrl.baseUrl)) {
      baseUrl = url;
    } else {
      baseUrl = '${ApiUrl.baseUrl}$url';
    }
    DataHelper.logValue("base url",
        "$baseUrl,,, $params,,,, $queryParams,, ${formData.fields}");

    try {
      if (method == Method.POST) {
        if (queryParams.isNotEmpty) {
          response = await _dio.post(baseUrl,
              data: queryParams, queryParameters: params);
        } else if (formData.fields.isNotEmpty) {
          response = await _dio.post(baseUrl, data: formData);
        } else {
          response = await _dio.post(baseUrl, data: params);
        }
      } else if (method == Method.DELETE) {
        response = await _dio.delete(url);
      } else if (method == Method.PATCH) {
        response = await _dio.patch(url);
      } else {
        response = await _dio.get(
          url,
          queryParameters: params,
        );
      }

      DataHelper.logValue(
        "response",
        response.data,
      );

      final ApiResponse psApiResponse = ApiResponse(response);
      DataHelper.isLoading.value = false;

      if (psApiResponse.isSuccessful) {
        DataHelper.logValue('response', 'Response Success');
        final dynamic hashMap = response.data;

        if (hashMap is! Map) {
          final List<T> tList = <T>[];
          hashMap.forEach((dynamic data) {
            tList.add(obj.fromMap(data as dynamic));
            DataHelper.logValue('objToMap', obj.fromMap(data as dynamic));
          });
          return ApiResource<R>(jsonDecode(response.data)['code'],
              jsonDecode(response.data)['message'], tList as R? ?? R as R?);
        } else {
          DataHelper.logValue("statusCode", hashMap['code']);
          return ApiResource<R>(
              hashMap['code'], hashMap['message'], obj.fromMap(hashMap));
        }
      } else {
        return ApiResource<R>(
            response.statusCode!, psApiResponse.errorMessage, null);
      }
    } on DioException catch (e) {
      DataHelper.isLoading.value = false;
      DataHelper.logValue('dioResponse', "${e.response},, ${e.message}");
      // throw Exception("No address associated with hostname ${ApiUrl.baseUrl}");
      if (await DataHelper.checkUserConnection()) {
        if (e.response != null) {
          final hashMap = jsonDecode(
            e.response!.toString(),
          );
          if (hashMap != null) {
            DataHelper.showToast(
              hashMap['message'],
            );
          }
        } else {
          DataHelper.showToast(
            AppStrings.timeoutError,
          );
        }
      } else {
        DataHelper.showToast(
          AppStrings.checkInternetConnection,
        );
      }

      DataHelper.logValue('dioResponse', "${e.response},, ${e.message}");
      return ApiResource<R>(e.response!.statusCode!, e.message ?? "", null);
    } on SocketException catch (e) {
      DataHelper.isLoading.value = false;
      throw Exception("No Internet Connection ${e.message}");
    } on FormatException {
      DataHelper.isLoading.value = false;
      throw Exception("Bad Response Format!");
    }
  }
}
