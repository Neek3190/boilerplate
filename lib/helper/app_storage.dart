
import 'storage_helper.dart';

class AppStorageHelper {
  static clearAllData() {
    StorageHelper.eraseData();
  }
/*
  static set setLanguage(
    String language,
  ) =>
      StorageHelper.writeData(
        AppStorageStrings.selectedLanguage,
        language,
      );

  static get getLanguage =>
      StorageHelper.readData(AppStorageStrings.selectedLanguage) ?? "en";

  static set setParkList(
    dynamic allParksList,
  ) =>
      StorageHelper.writeData(
        AppStorageStrings.parks,
        allParksList,
      );



  static get getParkList =>
      StorageHelper.readData(AppStorageStrings.parks) ?? [];

  static set setParkFilteredList(
    List<ParkDetailModel> parksFilterList,
  ) =>
      StorageHelper.writeData(
        AppStorageStrings.parkFilter,
        parksFilterList,
      );

  static get getParkFilteredList =>
      StorageHelper.readData(AppStorageStrings.parkFilter) ?? [];*/
}