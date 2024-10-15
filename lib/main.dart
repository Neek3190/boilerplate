
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_routes/get_app_routes_list.dart';
import 'utils/app_color.dart';
import 'utils/app_strings.dart';


// final dashboardController = Get.put(
//   DashboardController(),
//   permanent: true,
// );
/*final timerController = Get.put(
  TimerController(),
  permanent: true,
);*/

double appWidth = Get.width;
double appHeight = Get.height;
/*
Future<void> messageHandler(RemoteMessage message) async {
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.android,
    );
  } else {
    await Firebase.initializeApp();
  }
  DataHelper.logValue(
    "background message",
    '${message.notification!.title}',
  );
  DataHelper.logValue(
    "show notification",
    '${message.notification!.body}',
  );

  if (message.notification!.title != null) {
    LocalNotificationService().navigateUserDashboard(message);
  }
}

FlutterLocalNotificationsPlugin localNotifications =
    FlutterLocalNotificationsPlugin();
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel',
  'title', //title
  description: "description",
  importance: Importance.high,
  playSound: true,
  enableLights: true,
  showBadge: false,
  enableVibration: true,
  ledColor: Color(
    0xffF93549,
  ),
);*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await GetStorage.init('storage name');
/*
  if (AppStorageHelper.getLanguage == "") {
    Get.updateLocale(const Locale(englishCode));
  } else {
    Get.updateLocale(
      Locale(
        AppStorageHelper.getLanguage,
      ),
    );
  }

  try {
    await LocalNotificationService().initializePlatformNotifications();

    FirebaseMessaging.onBackgroundMessage(messageHandler);

    await localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: false,
      sound: true,
    );

    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: false,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  } catch (e) {
    DataHelper.logValue("Failed to initialize Firebase: ", "$e");
  }
*/
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // translations: Languages(),
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName.tr,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColor.themeColor,
        ),
        appBarTheme: AppBarTheme(
          color: AppColor.black,
          elevation: 0,
          iconTheme: ThemeData().iconTheme,
        ),
        useMaterial3: true,
      ),
      // initialBinding: AppBinding(),
      // initialRoute: AppRoutes.splashScreen,
      getPages: getRoutesList(),
    );
  }
}
