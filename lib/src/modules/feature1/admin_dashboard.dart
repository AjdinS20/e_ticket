import 'package:flutter/material.dart';
import 'package:e_ticket_ris/database_helper.dart';

import 'package:e_ticket_ris/src/data/entities/card.dart' as cd;
import 'package:shared_preferences/shared_preferences.dart';

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  // Method to rebuild the list after a card is deleted
  void _reloadData() {
    setState(() {});
  }

  void _deleteCard(int cardId) async {
    await DatabaseHelper.instance.deleteCard(cardId);
    _reloadData();
  }

  final _nazivController = TextEditingController();
  final _cijenaController = TextEditingController();

  void _showAddCardModal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Card'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _nazivController,
                decoration: InputDecoration(labelText: 'Naziv (Name)'),
              ),
              TextField(
                controller: _cijenaController,
                decoration: InputDecoration(labelText: 'Cijena (Price)'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Submit'),
              onPressed: () async {
                String naziv = _nazivController.text;
                int cijena = int.tryParse(_cijenaController.text) ?? 0;
                await DatabaseHelper.instance.addCard(naziv, cijena);
                Navigator.of(context).pop(); // Close the modal
                _reloadData(); // Refresh the card list
              },
            ),
          ],
        );
      },
    );
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
        title: Text('Admin Dashboard'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _showAddCardModal,
          ),
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              _logout(context);
            },
          ),
        ],
      ),
      body: FutureBuilder<List<cd.Card>>(
        future: DatabaseHelper.instance.getAllCards(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            List<cd.Card> cards = snapshot.data!;
            return ListView.builder(
              itemCount: cards.length,
              itemBuilder: (context, index) {
                cd.Card card = cards[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title:
                        Text(card.naziv + " " + card.cijena.toString() + "KM "),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteCard(card.id),
                    ),
                  ),
                );
              },
            );
          } else {
            return Text('No cards available');
          }
        },
      ),
    );
  }
}
