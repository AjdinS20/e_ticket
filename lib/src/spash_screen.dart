import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_ticket_ris/src/identity/auth_provider.dart';
import 'package:e_ticket_ris/src/startup.dart';

import 'config/color_constants.dart';
import 'config/image_constants.dart';
import 'helpers/route_helper.dart';
import 'helpers/shared_preferences.dart';

class SplashScreen extends ConsumerStatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> with RouteAware {
  bool notificationClosed = false;

  @override
  void didPopNext() {
    //This is used when the app is started from a notification
    ref.read(authProvider.notifier).notificationOpened();
    setState(() {
      notificationClosed = true;
    });
    super.didPopNext();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      RouteHelper.routeObserver.subscribe(this, ModalRoute.of(context)!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.microtask(() =>
        Navigator.pushNamedAndRemoveUntil(context, '/auth', (r) => false));

    return Scaffold(
      backgroundColor: const Color.fromRGBO(180, 188, 255, 0),
      body: Center(
        child: Image.asset(AllImages().splashScreenLogo),
      ),
    );
  }
}
