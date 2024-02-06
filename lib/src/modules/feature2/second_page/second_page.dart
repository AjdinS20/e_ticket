import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_ticket_ris/src/constants/esifarnik.dart';
import 'package:e_ticket_ris/src/data/models/response/sifarnik/sifarnik_model/sifarnik_model.dart';
import 'package:e_ticket_ris/src/services/sifarnik_service.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  SecondPageState createState() => SecondPageState();
}

class SecondPageState extends State<SecondPage> {
  late Future<List<SifarnikModel>> modeli;

  @override
  void initState() {
    modeli = SifarnikService().get(ESifarnik.SifMarka);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: FutureBuilder<List<SifarnikModel>>(
          future: modeli,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              var data = snapshot.data!;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.white,
                    child: Text(data[index].naziv ?? "Nema naziv"),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
