import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_models/get_logout_token_model.dart';
import 'package:rot_application/common/local_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/FirebaseMessagingService.dart';
import '../../../../common/PushNotificationService.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final count = 0.obs;

  Future<void> setupInteractedMessage() async {
    print('Push Notification for ios in foreground.......');
    // Get device token...
    PushNotificationService.getToken();
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  Future<void> _handleMessage(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    print('Notification pressed ios:-');
    print('Notification title:-${notification!.title}');
    print('Notification body:-${notification.body}');
    await Future.delayed(const Duration(seconds: 2, milliseconds: 500));
    Get.toNamed(Routes.NAV_BAR);
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    if (Platform.isAndroid) {
      await notificationSetup();
    } else {
      if (Platform.isIOS) {
        await setupInteractedMessage();
      }
    }
    await manageSession();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> notificationSetup() async {
    var initialzationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initialzationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
    print('Push Notification for android in foreground.......');
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
          alert: true, badge: true, sound: true);
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                //   channel.description,
                color: Colors.white,
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: "@mipmap/ic_launcher",
              ),
            ));
      }
      if (message != null) {
        print('Notification aaaaaaaaaaaaaaaaaaa ::::::::::::::::::::::');
        print(
            'Notification aaaaaaaaaaaaaaaaaaa :::::::::::::::::::::: ${notification!.title}');
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      print('Notification pressed:-');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        print('Notification pressed:-');
        print('Notification pressed:-${notification.body!}');

        Get.toNamed(Routes.NAV_BAR);
      }
    });
    FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    PushNotificationService.getToken();
  }

  void sendNotification() {
    final MyLocalNotificationService _localNotificationService =
        MyLocalNotificationService();
    _localNotificationService.initializeSettings(Get.context!);
    // _localNotificationService.showSimpleNotification();
  }

  manageSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 3));
    print("TOKEN:::::::::::${prefs.getString(ApiKeyConstants.token)}");
    if (prefs.getString(ApiKeyConstants.token) != null) {
      if (prefs.getString(ApiKeyConstants.type) != null) {
        LocalData.setUserType(false);
      } else {
        LocalData.setUserType(true);
      }
      callingCheckLogoutTokenApi(prefs.getString(ApiKeyConstants.userId) ?? '',
          prefs.getString(ApiKeyConstants.token) ?? '');
    } else {
      Get.offAndToNamed(Routes.GET_START);
    }
  }

  Future<void> callingCheckLogoutTokenApi(String userId, String token) async {
    try {
      Map<String, dynamic> getQueryParameters = {
        ApiKeyConstants.userId: userId,
        ApiKeyConstants.token: token,
      };
      LogoutTokenModel? logoutTokenModel =
          await ApiMethods.checkTokenExpirationApi(
              bodyParams: getQueryParameters);
      if (logoutTokenModel != null && logoutTokenModel.status == '1') {
        Get.offAllNamed(Routes.NAV_BAR);
      } else {
        Get.offAndToNamed(Routes.GET_START);
      }
    } catch (e) {
      Get.offAndToNamed(Routes.GET_START);
      print('Error:---${e.toString()}');
    }
  }
}
