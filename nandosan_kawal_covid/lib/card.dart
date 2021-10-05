import 'package:flutter/material.dart';
import 'package:nandosan_kawal_covid/card_widget.dart';

void main() => runApp(CardApp());

class CardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.green[600],
          body: Container(
            margin: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                CardWidget("POSITIF", "4000000"),
                CardWidget("Sembuh", "4000000"),
                CardWidget("Meninggal", "4000000"),
                CardWidget("DIRAWAT", "4000000"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
