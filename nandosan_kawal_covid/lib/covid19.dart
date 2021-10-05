import 'package:flutter/material.dart';
import 'package:nandosan_kawal_covid/card_widget.dart';
import 'package:nandosan_kawal_covid/network.dart';
import 'package:startapp/startapp.dart';

class CoronaApp extends StatefulWidget {
  @override
  _CoronaAppState createState() => _CoronaAppState();
}

class _CoronaAppState extends State<CoronaApp> {
  Future data;
  String varNama;

  void refreshDataApi() {
    data = getData();
  }

  @override
  void initState() {
    super.initState();
    refreshDataApi();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black45,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
              alignment: Alignment.center,
              child: Text(
                'KASUS CORONA INDONESIA',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Colors.white38),
              ),
            ),
            createTextFromApi(),
            Container(
              alignment: Alignment.bottomCenter,
              child: AdBanner(),
            )
          ],
        ),
      ),
    );
  }

  Widget createTextFromApi() {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
        child: FutureBuilder(
          future: data,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return SizedBox(
                height: 400.0,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    CardWidget(
                        "POSITIF", "${snapshot.data[0]["positif"].toString()}"),
                    CardWidget(
                        "SEMBUH", "${snapshot.data[0]["sembuh"].toString()}"),
                    CardWidget("MENINGGAL",
                        "${snapshot.data[0]["meninggal"].toString()}"),
                    CardWidget(
                        "DI RAWAT", "${snapshot.data[0]["dirawat"].toString()}")
                  ],
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ));
  }

  Future getData() async {
    Network network = Network("https://api.kawalcorona.com/indonesia/");
    return network.fetchData();
  }
}
