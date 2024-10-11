// It will consist the model which will be the actual response of an api

import 'package:boilerplate/api_service/api_object.dart';
import 'package:boilerplate/app_api_service_model/app_api_service_model_demo/app_api_service_data_model_demo.dart';

class Model extends ApiObject<Model> {
  dynamic status;
  DataModel? dataModel;
  
 // along with these two variables more variables can be included or these can be changes as per the change in the response of the api.
  Model({
    this.status,
    this.dataModel,
  });

@override
  Model fromMap(dynamicData) {
    if (dynamicData != null) {
      return Model(
        status: dynamicData['status'],
        dataModel: dynamicData['dataModel'] == null
            ? null
            : DataModel().fromMap(
                dynamicData['dataModel'],
              ),
      );
    }
    return dynamicData;
  }
 @override
  List<Model> fromMapList(List dynamicDataList) {
    final List<Model> model =
        <Model>[];

    for (dynamic json in dynamicDataList) {
      if (json != null) {
        model.add(fromMap(json));
      }
    }
    return model;
  }

  @override
  String? getPrimaryKey() {
    return status.toString();
  }

    @override
  Map<String, dynamic>? toMap(Model object) {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (object != null) {
      data['status'] = object.status;
      data['dataModel'] = object.dataModel != null
          ? DataModel().toMap(
              object.dataModel!,
            )
          : null;
      return data;
    } else {
      return null;
    }
  }

   @override
  List<Map<String, dynamic>?> toMapList(List<Model> objectList) {
    final List<dynamic> dynamicList = <dynamic>[];
    for (dynamic data in objectList) {
      if (data != null) {
        dynamicList.add(toMap(data));
      }
    }

    return dynamicList as List<Map<String, dynamic>?>;
  }

}




/*
class ExModel extends ApiObject<ExModel> {
  dynamic status;
  ExDetailModel? exDetailModel;

  ExModel({
    this.exDetailModel,
    this.status,
  });

  @override
  ExModel fromMap(dynamicData) {
    if (dynamicData != null) {
      return ExModel(
        status: dynamicData['status'],
        exDetailModel: dynamicData['data'] == null
            ? null
            : ExDetailModel().fromMap(
                dynamicData['data'],
              ),
      );
    }
    return dynamicData;
  }

  @override
  List<ExModel> fromMapList(List dynamicDataList) {
    final List<ExModel> exerciseDetailModel =
        <ExModel>[];

    for (dynamic json in dynamicDataList) {
      if (json != null) {
        exerciseDetailModel.add(fromMap(json));
      }
    }
    return exerciseDetailModel;
  }

  @override
  String? getPrimaryKey() {
    return status.toString();
  }

  @override
  Map<String, dynamic>? toMap(ExModel object) {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (object != null) {
      data['status'] = object.status;
      data['data'] = object.exDetailModel != null
          ? ExDetailModel().toMap(
              object.exDetailModel!,
            )
          : null;
      return data;
    } else {
      return null;
    }
  }

  @override
  List<Map<String, dynamic>?> toMapList(List<ExModel> objectList) {
    final List<dynamic> dynamicList = <dynamic>[];
    for (dynamic data in objectList) {
      if (data != null) {
        dynamicList.add(toMap(data));
      }
    }

    return dynamicList as List<Map<String, dynamic>?>;
  }
}
*/