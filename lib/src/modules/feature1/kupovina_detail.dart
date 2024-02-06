import 'package:e_ticket_ris/src/modules/feature1/kupovina.dart';
import 'package:flutter/material.dart';
import 'package:e_ticket_ris/database_helper.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:intl/intl.dart';

class KupovinaDetailScreen extends StatelessWidget {
  final int kupovinaId;

  KupovinaDetailScreen({Key? key, required this.kupovinaId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Karta'),
        backgroundColor: Color(0xFFB4BCFF), // Stylish app bar color
        elevation: 0,
      ),
      body: FutureBuilder<Kupovina>(
        future: DatabaseHelper.instance.getKupovinaDetails(kupovinaId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            Kupovina kupovina = snapshot.data!;
            String qrData =
                '${kupovina.idKupovina}-${kupovina.idKorisnik}-${kupovina.idKarta}';
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Detalji Kupovine',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    ListTile(
                      title: Text(
                        'Datum kupovine',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        kupovina.datumKupovine != null
                            ? DateFormat('dd.MM.yyyy')
                                .format(kupovina.datumKupovine!)
                            : 'N/A',
                        style: TextStyle(fontSize: 16),
                      ),
                      contentPadding: EdgeInsets.zero,
                    ),
                    SizedBox(height: 30),
                    if (qrData.isNotEmpty)
                      Center(
                        child: QrImageView(
                          data: qrData,
                          version: QrVersions.auto,
                          size: 200.0,
                          gapless: false,
                          embeddedImage: AssetImage(
                              'assets/logo.png'), // Optional: embed a logo image
                          embeddedImageStyle: QrEmbeddedImageStyle(
                            size: Size(40, 40), // Size of the embedded image
                          ),
                        ),
                      ),
                    SizedBox(height: 30),
                    // Add any other information or widgets here
                  ],
                ),
              ),
            );
          } else {
            return Center(child: Text('No Kupovina details found'));
          }
        },
      ),
    );
  }
}
