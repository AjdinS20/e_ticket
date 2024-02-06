import 'package:e_ticket_ris/database_helper.dart';
import 'package:e_ticket_ris/src/data/entities/card.dart' as cd;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:e_ticket_ris/src/config/color_constants.dart';
import 'package:e_ticket_ris/src/modules/feature2/subject_card.dart';

import '../../identity/auth_provider.dart';

class Feature2 extends ConsumerStatefulWidget {
  const Feature2({Key? key}) : super(key: key);

  @override
  Feature2State createState() => Feature2State();
}

class Feature2State extends ConsumerState<Feature2> {
  final cardNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void _handlePurchase(int cardId) async {
      if (cardNumberController.text.isNotEmpty) {
        bool success = await DatabaseHelper.instance.purchaseCard(cardId);
        if (success) {
          // Show a success message or update the UI
          print('Purchase successful');
        } else {
          // Handle the error, show an error message
          print('Purchase failed');
        }
      }
    }

    void _showPurchaseModal(cd.Card card) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0xFFB4BCFF),
            title: Text('Purchase Card'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Kartica: ${card.naziv}'),
                SizedBox(height: 12),
                Text('Cijena: ${card.cijena}'),
                SizedBox(height: 12),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Broj kreditne kartice (Demo)',
                  ),
                  controller: cardNumberController,
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Nazad'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
              TextButton(
                  child: Text('Potvrdi'),
                  onPressed: () {
                    _handlePurchase(card.id);
                    Navigator.of(context).pop();
                    if (cardNumberController.text.isNotEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Uspješno kupljena karta')));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Morate unijeti broj kartice')));
                    }
                  }),
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Available Cards')),
      body: FutureBuilder<List<cd.Card>>(
        future: DatabaseHelper.instance.getAvailableCards(),
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
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            card.naziv + " " + card.cijena.toString() + "KM",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFB4BCFF),
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            elevation: 0,
                            side: BorderSide.none,
                          ),
                          onPressed: () => _showPurchaseModal(card),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.shopping_cart),
                              SizedBox(width: 8),
                              Text('Kupi'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
                child: Text(
              'Nema karata dostupnih za kupovinu',
              style: TextStyle(color: Colors.black, fontSize: 22),
            ));
          }
        },
      ),
    );
  }
}
