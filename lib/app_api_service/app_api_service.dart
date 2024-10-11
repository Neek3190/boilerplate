import 'package:boilerplate/api_service/rest_client.dart';
class ApiService extends RestClient {
// to call the post api

/*
  Future<ApiResource<ModelInWhichApiResponseWillCome>> apiName({
    required ModelToBeSentForParams model,
  }) async {
    const String url = ApiUrl.baseUrl ;

    Map<String, dynamic> params = {};
    Map<String, dynamic> queryParams = {};

    FormData formData = FormData.fromMap({
      emailKey : 'data to be sent'(model.email)
    });
    ApiResource<ModelInWhichApiResponseWillCome> registerModel = await request(
      ModelInWhichApiResponseWillCome(),
      url,
      Method.POST,
      params,
      queryParams,
      formData,
    );
    return registerModel;

  } */

  ///---------- call get api ----------///
/*
  Future<ApiResource<ModelInWhichApiResponseWillCome>> callGetWorkoutCategoryApi() async {
    const String url = ApiUrl.getWorkoutCategory;

    Map<String, dynamic> params = {};
    Map<String, dynamic> queryParams = {};

    FormData formData = FormData.fromMap({});

    ApiResource<ModelInWhichApiResponseWillCome> getWorkoutCategory = await request(
      ModelInWhichApiResponseWillCome(),
      url,
      Method.GET,
      params,
      queryParams,
      formData,
    );

    return getWorkoutCategory;
  }*/
}
