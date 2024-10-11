// It will be the mixin conisting all the functions and variables regarding a particular flow for example this whole mixin will be of auth conssiting all the functions and varaibale required at the time of auth screens including the api to be call.

mixin AuthMixin {
/*
  static Rx<AuthEnum> authScreenEnum = AuthEnum.signIn.obs;

  static Rx<AuthEnum> get getAuthScreenEnum => authScreenEnum;

  static set setAuthScreenEnum(AuthEnum authEnum) {
    clearController();
    DataHelper.isLoading.value = false;
    setLoginPass = true;
    setConfirmPass = true;
    authScreenEnum.value = authEnum;
  }

  static RxBool loginPass = true.obs;

  static RxBool get getLoginPass => loginPass;

  static set setLoginPass(
    bool isPass,
  ) {
    loginPass.value = isPass;
  }


  ///---- call sign-up api ----///
  static callSignupApi({
    required AuthRequestModel authRequestModel,
  }) async {
    DataHelper.isLoading.value = true;
    await AppApiService()
        .callSignUpApi(
      authRequestModel: authRequestModel,
    )
        .then((value) {
      DataHelper.isLoading.value = false;
      if (value != null) {
        if (value.data != null) {
          DataHelper.showToast(
            value.data!.message ?? '',
          );
          if (value.data!.status == 200 || value.data!.status == 201) {
            AppClickListener.goToLoginScreen();
          }
        }
      }
    });
  }

  ///---- call sign-in api ---///
  static callSignInApi({
    required AuthRequestModel authRequestModel,
  }) async {
    DataHelper.isLoading.value = true;
    await AppApiService()
        .callSignInApi(
      authRequestModel: authRequestModel,
    )
        .then((value) async {
      DataHelper.isLoading.value = false;
      if (value != null) {
        if (value.data != null) {
          DataHelper.showToast(
            value.data!.message ?? '',
          );
          if (value.data!.status == 200 || value.data!.status == 201) {
            if (value.data!.data != null) {
              await storeUserInfo(
                signInDataModel: value.data!.data!,
              );
              AuthMixin.callProfileInfoApi(userId: AppStorageHelper.getUserId);

              AppClickListener.goToDashboard(
                fromAuth: true,
              );
            }
          }
        }
      }
    });
  }

  static storeUserInfo({
    required SignInDataModel signInDataModel,
    bool isSignIn = true,
  }) async {
    AppStorageHelper.setUserId = signInDataModel.userId.toString();

    if (signInDataModel.userName != null || signInDataModel.userName != "") {
      AppStorageHelper.setUserName = signInDataModel.userName!;
    }

    if (signInDataModel.userEmail != null || signInDataModel.userEmail != "") {
      AppStorageHelper.setUserEmail = signInDataModel.userEmail!;
    }
    if (!isSignIn) {
      if (signInDataModel.aboutMe != null || signInDataModel.aboutMe != "") {
        AppStorageHelper.setAboutMe = signInDataModel.aboutMe!;
      }
    }
    if (signInDataModel.userDob != null || signInDataModel.userDob != "") {
      AppStorageHelper.setUserDob = signInDataModel.userDob!;
    }

    if (signInDataModel.userPhone != null || signInDataModel.userPhone != "") {
      AppStorageHelper.setUserPhone = signInDataModel.userPhone!;
    }

    if (signInDataModel.userImage != null || signInDataModel.userImage != "") {
      AppStorageHelper.setUserImage = signInDataModel.userImage!;
    }

    if (signInDataModel.userLocation != null ||
        signInDataModel.userLocation != "") {
      AppStorageHelper.setUserLocation = signInDataModel.userLocation!;
    }

    DataHelper.logValue(
      'authUserId',
      AppStorageHelper.getUserId,
    );
    DataHelper.logValue(
      'authUserName',
      AppStorageHelper.getUserName,
    );
    DataHelper.logValue(
      'authUserEmail',
      AppStorageHelper.getUserEmail,
    );
    DataHelper.logValue(
      'authUserDob',
      AppStorageHelper.getUserDob,
    );
    DataHelper.logValue(
      'authUserPhone',
      AppStorageHelper.getUserPhone,
    );
    DataHelper.logValue(
      'authUseImage',
      AppStorageHelper.getUserImage,
    );
    DataHelper.logValue(
      'authUserLocation',
      AppStorageHelper.getUserLocation,
    );
  }

  ///---- call profile info api ---///
  static callProfileInfoApi({
    required String userId,
  }) async {
    DataHelper.isLoading.value = true;
    await AppApiService()
        .callGetProfileApi(
      userId: userId,
    )
        .then(
      (value) async {
        DataHelper.isLoading.value = false;
        if (value != null) {
          if (value.data != null) {
            if (value.data!.status == 200 || value.data!.status == 201) {
              if (value.data!.data != null) {
                await storeUserInfo(
                  signInDataModel: value.data!.data!,
                  isSignIn: false,
                );
                dashboardController.fetchBottomNavigationBar();
                dashboardController.fetchProfileDetail();
              }
            }
          }
        }
      },
    );
  }

  ///--- call logout api ---///
  static callLogoutApi() async {
    Get.back();
    Get.back();
    DataHelper.isLoading.value = true;
    await AppApiService()
        .callLogoutApi(
      userId: AppStorageHelper.getUserId,
    )
        .then((value) {
      DataHelper.isLoading.value = false;

      if (value != null) {
        if (value.status == 200 || value.status == 201) {
          AppClickListener.logoutUser();
          AppStorageHelper.clearAllData();
        } else {
          DataHelper.showToast(
            value.message,
          );
        }
      }
    });
  }

*/
}
