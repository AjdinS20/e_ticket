// import 'dart:convert';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../identity/auth_provider.dart';

// final GlobalKey<NavigatorState> navigatorKey =
//     GlobalKey(debugLabel: "Main Navigator");
// String routeToGo = '/';

// abstract class NotificationHelper {
//   String? payload;

//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   static const AndroidNotificationChannel channel = AndroidNotificationChannel(
//     'high_importance_channel',
//     'High Importance Notifications',
//     description: 'This channel is used for important notifications.',
//     importance: Importance.max,
//     playSound: true,
//   );

//   Future<void> setupInteractedMessage(WidgetRef ref) async {
//     // final fcmToken = await FirebaseMessaging.instance.getToken();

//     // Get any messages which caused the application to open from
//     // a terminated state.
//     RemoteMessage? initialMessage =
//         await FirebaseMessaging.instance.getInitialMessage();
//     if (initialMessage != null) {
//       _handleMessageFromClosed(initialMessage, ref);
//     }
// /* 
//     //initialize background
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler); */

//     // Also handle any interaction when the app is in the background via a
//     // Stream listener
//     FirebaseMessaging.onMessageOpenedApp
//         .listen((message) => _handleMessageFromBackground(message));

//     // Also handle any interaction when the app is in the foreground
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);

//     // initialize notification for android
//     var initialzationSettingsAndroid =
//         const AndroidInitializationSettings('@mipmap/ic_stat_fs');
//     var initializationSettings =
//         InitializationSettings(android: initialzationSettingsAndroid);
//     flutterLocalNotificationsPlugin.initialize(initializationSettings);

//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse: selectNotification);

//     FirebaseMessaging.onMessage
//         .listen((message) => _handleMessageFromForeground(message));
//   }

//   void _handleMessageFromClosed(RemoteMessage message, WidgetRef ref) {
//     if (message.data['type'] != null) {
//       ref.read(authProvider.notifier).notificationOpened();
//       navigatorKey.currentState?.pushNamed(
//         '/second',
//         arguments: message.data,
//       );
//       routeToGo = '/second';
//     }
//   }

//   /* static Future<void> _firebaseMessagingBackgroundHandler(
//       RemoteMessage message) async {
//     routeToGo = '/second';
//   } */

//   void _handleMessageFromBackground(RemoteMessage message) {
//     if (message.data['type'] != null) {
//       navigatorKey.currentState?.pushNamed(
//         '/second',
//         arguments: message.data,
//       );
//     }
//   }

//   void _handleMessageFromForeground(RemoteMessage message) {
//     RemoteNotification? notification = message.notification;
//     AndroidNotification? android = message.notification?.android;

//     // If `onMessage` is triggered with a notification, construct our own
//     // local notification to show to users using the created channel.
//     if (notification != null && android != null) {
//       flutterLocalNotificationsPlugin.show(
//           notification.hashCode,
//           notification.title,
//           notification.body,
//           NotificationDetails(
//             android: AndroidNotificationDetails(
//               channel.id,
//               channel.name,
//               channelDescription: channel.description,
//               icon: "@mipmap/ic_stat_fs",
//               // other properties...
//             ),
//           ),
//           payload: json.encode(message.data));
//     }
//   }

//   static void selectNotification(NotificationResponse response) {
//     if (response.payload != null) {
//       navigatorKey.currentState
//           ?.pushNamed("/second", arguments: response.payload);
//     }
//   }
// }
