import 'package:boilerplate/api_service/api_object.dart';

class DataModel extends ApiObject<DataModel> {
  String? demo1;
  List<dynamic>?
      demo2; // Instead fo dynamic you must enter the model of demo2 which will consist of all the variable being added in response of demo2 as list format.
  dynamic
      demo3; // Instead fo dynamic you must enter the model of demo3 which will consist of all the variable being added in response of demo3

  DataModel({
    this.demo1,
    this.demo2,
    this.demo3,
  });

  @override
  DataModel fromMap(dynamicData) {
    if (dynamicData != null) {
      return DataModel(
        demo1: dynamicData['demo1'] ?? "",
        demo2: dynamicData['demo2'] == [] || dynamicData['demo2'] == null
            ? []
            : List<dynamic>.from(
                dynamicData['demo2'].map(
                  (x) => fromMap(x),
                ),
              ), //instead of List<dynamic> it shoudl be model m=name of which demo2 is  and in line map((x) => fromMap(x) it should be like map((x) => dynamic().fromMap(x) where again dyanmic refers to the model for demo2.

        demo3: dynamicData['demo3'] == null
            ? null
            : fromMap(
                dynamicData['demo3'],
              ),
        //instead of  in line fromMap(dynamicData['demo3'],) it should be like  dynamic().fromMap(dynamicData['demo3'],) where  dyanmic refers to the model for demo3.
      );
    }
    return dynamicData;
  }

  @override
  Map<String, dynamic>? toMap(DataModel object) {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (object != null ) {
      data['demo1'] = object.demo1;
      data['demo2'] = object.demo2 != []
          ? List<dynamic>.from(object.demo2!.map((x) => toMap(x)))
          : []; //instead of List<dynamic> it shoudl be model m=name of which demo2 is  and in line map((x) => toMap(x) it should be like map((x) => dynamic().toMap(x) where again dyanmic refers to the model for demo2.
      data['demo3'] = object.demo3 != null
          ? toMap(
              object.demo3,
            )
          : null;
      //instead of toMap(object.demo3,) it should be like  dynamic().toMap(object.demo3,) where dyanmic() refers to the model for demo3.
      return data;
    } else {
      return null;
    }
  }

  @override
  List<DataModel> fromMapList(List dynamicDataList) {
    final List<DataModel> model = <DataModel>[];
    for (dynamic json in dynamicDataList) {
      if (json != null) {
        model.add(fromMap(json));
      }
    }
    return model;
  }

  @override
  String? getPrimaryKey() {
    return demo1.toString();
  }

  @override
  List<Map<String, dynamic>?> toMapList(List<DataModel> objectList) {
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

Below is the real ex of the data model being used in api---->
class ExDetailModel extends ApiObject<ExDetailModel> {
  String? name, description, icon;
  List<VListModel>? vList;

  ExDetailModel({
    this.name,
    this.description,
    this.icon,
    this.vList,
  });

  @override
  ExDetailModel fromMap(dynamicData) {
    if (dynamicData != null) {
      return ExDetailModel(
        name: dynamicData['name'] ?? "",
               vList: dynamicData['vd'] == [] || dynamicData['vd'] == null
            ? []
            : List<VListModel>.from(
                dynamicData['vd'].map(
                  (x) => VListModel().fromMap(x),
                ),
              ),
      );
    }
    return dynamicData;
  }

  @override
  Map<String, dynamic>? toMap(ExDetailModel object) {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (object != null) {
      data['name'] = object.name;
      data['vd'] = object.vList != []
          ? List<VListModel>.from(
              object.vList!.map(
                (x) => VListModel().toMap(
                  x,
                ),
              ),
            )
          : [];
      return data;
    } else {
      return null;
    }
  }

  @override
  List<ExDetailModel> fromMapList(List dynamicDataList) {
    final List<ExDetailModel> exDetailModel =
        <ExDetailModel>[];

    for (dynamic json in dynamicDataList) {
      if (json != null) {
        exDetailModel.add(fromMap(json));
      }
    }
    return exDetailModel;
  }

  @override
  String? getPrimaryKey() {
    return name.toString();
  }

  @override
  List<Map<String, dynamic>?> toMapList(
      List<ExDetailModel> objectList) {
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
