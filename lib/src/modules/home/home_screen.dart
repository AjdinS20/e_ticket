import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_ticket_ris/src/config/color_constants.dart';
import 'package:e_ticket_ris/src/helpers/notification_helper.dart';
import 'package:e_ticket_ris/src/modules/feature1/feature1.dart';
import 'package:e_ticket_ris/src/modules/feature2/feature2.dart';
import 'package:e_ticket_ris/src/modules/feature3/feature3.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  int selectedIndex = 0;

  HomeScreenState();

//list of widgets to call ontap
  final widgetOptions = [
    new Feature1(),
    new Feature2(),
    new ProfilePageContent(),
  ];
  final widgetTitle = ["Moje karte", "Kupovina", "Profil"];
  final navigatorKey = GlobalKey<NavigatorState>();

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userId');
    Navigator.of(context).pushReplacementNamed('/auth');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widgetTitle.elementAt(selectedIndex),
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFFB4BCFF),
        elevation: 0,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String result) {
              if (result == 'logout') {
                _logout(context);
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'logout',
                child: Text('Logout'),
              ),
            ],
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ), // Icon for the button
          ),
        ],
      ),
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFB4BCFF),
        key: navigatorKey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.card_membership_outlined,
                color: Colors.white,
              ),
              label: "Moje karte"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
              ),
              label: "Kupovina"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_sharp,
                color: Colors.white,
              ),
              label: "Profil"),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.white,
        unselectedItemColor: Colors.white,
        onTap: onItemTapped,
        selectedLabelStyle: const TextStyle(color: Colors.red, fontSize: 20),
      ),
    );
  }
}
