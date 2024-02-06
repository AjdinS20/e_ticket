import 'package:e_ticket_ris/src/modules/auth/register.dart';
import 'package:e_ticket_ris/src/modules/feature1/admin_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:e_ticket_ris/src/modules/feature1/qrpage.dart';
import 'package:e_ticket_ris/src/modules/feature2/second_page/second_page.dart';

import '../modules/auth/login_screen.dart';
import '../modules/feature1/feature1.dart';
import '../modules/feature2/feature2.dart';
import '../modules/feature3/feature3.dart';
import '../modules/home/home_screen.dart';
import '../spash_screen.dart';

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => SplashScreen());
    case '/home':
      return MaterialPageRoute(builder: (_) => HomeScreen());

    case '/register':
      return MaterialPageRoute(builder: (_) => RegisterScreen());
    case '/auth':
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case '/feature1':
      return MaterialPageRoute(builder: (_) => const Feature1());
    case '/feature2':
      return MaterialPageRoute(builder: (_) => const Feature2());
    case '/second':
      return MaterialPageRoute(builder: (_) => const SecondPage());
    case '/feature3':
      return MaterialPageRoute(builder: (_) => ProfilePageContent());
    case '/qr':
      return MaterialPageRoute(builder: (_) => const QRPage());
    case '/admindashboard':
      return MaterialPageRoute(builder: (_) => AdminDashboard());
    default:
      return MaterialPageRoute(builder: (_) => SplashScreen());
  }
}
