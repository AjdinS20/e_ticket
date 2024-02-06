import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:e_ticket_ris/src/config/color_constants.dart';

import '../../helpers/shared_preferences.dart';
import '../../startup.dart';

class QRPage extends ConsumerStatefulWidget {
  const QRPage({Key? key}) : super(key: key);

  @override
  QRPageState createState() => QRPageState();
}

class QRPageState extends ConsumerState<QRPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String? qrText = "";
  bool dataRead = false;
  QRViewController? controller;
  Future<void> logout() async {
    final navigator = Navigator.of(context);
    await singleton.get<SharedPreferencesHelper>().removeIdentity();
    navigator.pushNamedAndRemoveUntil("/auth", (route) => false);
  }

  Future<void> _checkForPermission() async {
    var status = await Permission.camera.status;
    if (status.isDenied) {
      if (await Permission.camera.request().isGranted) {
        // Either the permission was already granted before or the user just granted it.
        controller?.resumeCamera();
      }
    } else if (status.isGranted) {
      controller?.resumeCamera();
    } else {
      print('Camera permission is denied.');
    }
  }

  void confirmScan(String qrContent) {
    //Call and await the api here an then move to the attendance page
    //
    final snackBar = SnackBar(
      content: Text("Uspješno registrovanje prisustva"),
      duration: Duration(seconds: 3), // Duration is optional
      // You can add more properties like action for undo functionality, etc.
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    print(qrContent.toString());
    Navigator.pop(context); // for now set to just move back to the last page
  }

  @override
  Widget build(BuildContext context) {
    void _onQRViewCreated(QRViewController controller) async {
      this.controller = controller;
      controller.scannedDataStream.listen((scanData) {
        if (!dataRead) {
          setState(() {
            qrText = scanData.code;
          });
          confirmScan(qrText ?? "");
          dataRead = true;
        }
      });
    }

    return Container(
        color: hexToColor("#182138"),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: (MediaQuery.of(context)!.size.height / 100) * 80,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
            SizedBox(height: 20),
            IconButton(
              onPressed: () async {
                await _checkForPermission();
              },
              icon: Icon(
                Icons.camera,
                color: Colors.white, // Hex color for the icon
                size: 52, // Size of the icon
              ),
              // No additional styling required for a simple icon button
            )
          ],
        ));
  }
}
