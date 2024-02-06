import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:e_ticket_ris/src/helpers/route_helper.dart';
import 'package:e_ticket_ris/src/spash_screen.dart';

import 'config/theme_config.dart';
import 'helpers/notification_helper.dart';
import 'routes/index.dart';

class App extends ConsumerStatefulWidget {
  //with NotificationHelper
  App({Key? key}) : super(key: key);
  @override
  AppState createState() => AppState();
}

class AppState extends ConsumerState<App> {
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey(debugLabel: "Main Navigator");
  String routeToGo = '/';
  @override
  void initState() {
    super.initState();

    // Run code required to handle interacted messages in an async function
    // as initState() must not be async
    // widget.setupInteractedMessage(ref);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Starter',
      navigatorKey: navigatorKey,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeConfig.lightTheme,
      darkTheme: ThemeConfig.darkTheme,
      //themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      navigatorObservers: [RouteHelper.routeObserver],
      initialRoute: (routeToGo != null) ? routeToGo : '/',
      onGenerateRoute: routes,
      home: SplashScreen(),
    );
  }
}
