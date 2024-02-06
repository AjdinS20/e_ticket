import 'package:e_ticket_ris/database_helper.dart';
import 'package:e_ticket_ris/src/data/entities/card.dart' as cd;
import 'package:e_ticket_ris/src/modules/feature1/kupovina_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:e_ticket_ris/src/config/color_constants.dart';
import 'package:e_ticket_ris/src/modules/feature1/attendance_card.dart';

import '../../helpers/shared_preferences.dart';
import '../../startup.dart';

class Feature1 extends ConsumerStatefulWidget {
  const Feature1({Key? key}) : super(key: key);

  @override
  Feature1State createState() => Feature1State();
}

class Feature1State extends ConsumerState<Feature1> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String? qrText = "";
  QRViewController? controller;
  Future<void> logout() async {
    final navigator = Navigator.of(context);
    await singleton.get<SharedPreferencesHelper>().removeIdentity();
    navigator.pushNamedAndRemoveUntil("/auth", (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<List<cd.Card>>(
        future: DatabaseHelper.instance.getUserCards(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.length > 0) {
            List<cd.Card> cards = snapshot.data!;
            return ListView.builder(
              itemCount: cards.length,
              itemBuilder: (context, index) {
                cd.Card card = cards[index];
                return Card(
                  surfaceTintColor: Color(0xFFB4BCFF),
                  elevation: 5, // Adds a shadow
                  margin: EdgeInsets.all(8), // Adds margin around each card
                  child: ListTile(
                    leading: Icon(Icons.credit_card), // Example icon
                    title: Text(
                      card.naziv + " " + card.cijena.toString() + "KM",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Više informacija ovdje'),
                    trailing: IconButton(
                      icon: Icon(Icons.open_in_new),
                      onPressed: () {
                        // Handle card action
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              KupovinaDetailScreen(kupovinaId: card.id),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return Center(
                child: Text(
              'Nemate kupljenih karata',
              style: TextStyle(color: Colors.black, fontSize: 22),
            ));
          }
        },
      ),
    );
  }
}
