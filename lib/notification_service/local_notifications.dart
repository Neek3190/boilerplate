/*import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../firebase_options.dart';
import '../helper/app_storage.dart';
import '../helper/data_helper.dart';
import '../main.dart';

final StreamController<PushNotification> didReceiveLocalNotificationStream =
    StreamController<PushNotification>.broadcast();

final StreamController<String?> selectNotificationStream =
    StreamController<String?>.broadcast();

RxString notificationOrderId = "".obs;

String? selectedNotificationPayload;

/// A notification action which triggers a url launch event
const String urlLaunchActionId = 'id_1';

/// A notification action which triggers a App navigation event
const String navigationActionId = 'id_3';

/// Defines a iOS/MacOS notification category for text input actions.
const String darwinNotificationCategoryText = 'textCategory';

/// Defines a iOS/MacOS notification category for plain actions.
const String darwinNotificationCategoryPlain = 'plainCategory';

String fcmToken = "";
const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings(
  '@drawable/ic_notification',
);

const DarwinInitializationSettings initializationSettingsDarwin =
    DarwinInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);

const InitializationSettings initializationSettings = InitializationSettings(
  android: initializationSettingsAndroid,
  iOS: initializationSettingsDarwin,
);

void onDidReceiveLocalNotification(
    int id, String? title, String? body, String? payload) {
  DataHelper.logValue(
      'onDidReceiveLocalNotification', "$id,,, $title ,,, $body,,, $payload");
}

class LocalNotificationService {
  LocalNotificationService();

  Future<void> initializePlatformNotifications() async {
    if (Platform.isAndroid) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.android,
      );
    } else {
      await Firebase.initializeApp();
    }

    initializeMessage();
    getFcmToken();
    getMessage();
  }

  static getFcmToken() async {
    ///----- get fcm token ----------////
    ///
    if (Platform.isIOS) {
      await FirebaseMessaging.instance.getAPNSToken().then((value) {
        DataHelper.logValue(
          "apnToken--ios",
          value,
        );
        if (value != null) {
          AppStorageHelper.storeFcmToken = value;
        } else {}
      });
    } else {
      await FirebaseMessaging.instance.getToken().then((value) {
        if (value!.isNotEmpty) {
          fcmToken = value;

          AppStorageHelper.storeFcmToken = fcmToken;
        }
      });
    }

    DataHelper.logValue("fcmToken", fcmToken);
  }

  void getMessage() {
    ///---- get notification message -----////

    FirebaseMessaging.onMessage.listen(
      (message) {
        DataHelper.logValue("onMessage", message);
        navigateUserDashboard(
          message,
        );
        if (message.notification != null) {
          DataHelper.logValue(
              'Message also contained a notification:', message.notification);
        }
      },
      cancelOnError: false,
      onDone: () {},
    );

    ///------BACKGROUND MESSAGES - onResume-----/////
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        DataHelper.logValue("onMessageOpenedApp", message);
      },
      cancelOnError: false,
      onDone: () {},
    );

    ///---------- BACKGROUND MESSAGES - onLaunch --------////
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

    firebaseMessaging.getInitialMessage().then((message) {
      DataHelper.logValue("firebaseMessaging", message);
      if (message != null) {
        navigateUserDashboard(
          message,
        );
      }
    }, onError: (error) {
      DataHelper.logValue("firebaseError", error);
    });
  }

  void navigateUserDashboard(
    RemoteMessage message,
  ) async {
    showNotification(
      id: Random().nextInt(1000),
      title: message.notification!.title!,
      message: message.notification!.body!.toString(),
      payload: message.data,
      image: '',
      sound: "default",
    );
  }

  initializeMessage() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: false,
      sound: true,
    );

    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await localNotifications.getNotificationAppLaunchDetails();
    if (notificationAppLaunchDetails != null &&
        notificationAppLaunchDetails.didNotificationLaunchApp) {
      onSelectNotification(notificationAppLaunchDetails.notificationResponse!);
    }
    await localNotifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onSelectNotification,
    );
    await FirebaseMessaging.instance.subscribeToTopic('all');
  }

  onSelectNotification(NotificationResponse notificationResponse) {
    if (notificationResponse.payload!.isNotEmpty &&
        notificationResponse.notificationResponseType.name.isEmpty) {}
    DataHelper.logValue("notificationType", notificationResponse.payload);
    var jsonData = jsonDecode(notificationResponse.payload!);
    DataHelper.logValue(
      "jsonValue",
      jsonData,
    );
  }

  showNotification({
    int id = 123,
    required String title,
    required String message,
    required String image,
    required String sound,
    required Map<String, dynamic> payload,
  }) async {
    DarwinNotificationDetails iOSPlatformChannelSpecifics =
        const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: false,
      presentSound: true,
      badgeNumber: 0,
      subtitle: '',
      categoryIdentifier: darwinNotificationCategoryPlain,
    );

    AndroidNotificationDetails androidPlatformChannelSpecifics =
        const AndroidNotificationDetails(
      'high_importance_channel',
      'appName',
      channelDescription: 'channel name',
      importance: Importance.max,
      priority: Priority.high,
      icon: 'ic_notification',
      color: Color(
        0xffF93549,
      ),
      playSound: true,
    );

    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await localNotifications.show(id, title, message, platformChannelSpecifics,
        payload: json.encode(payload));
    DataHelper.logValue("json.encode(payload)", '$payload');
  }
}
*/