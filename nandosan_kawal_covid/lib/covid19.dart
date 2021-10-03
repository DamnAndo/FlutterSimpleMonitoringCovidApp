import 'package:flutter/material.dart';
import 'package:nandosan_kawal_covid/network.dart';

class CoronaApp extends StatefulWidget {
 
  @override
  _CoronaAppState createState() => _CoronaAppState();
}

class _CoronaAppState extends State<CoronaApp> {

  Future data;
  String varNama;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = getData();
    // data.then((value) => {
    //     varNama = value[0]['name']
    // });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Corona App')
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            alignment: Alignment.topLeft,
            child: Text('Jumlah Kasus Indonesia',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0
            ),),
          ),
          createTextFromApi(),
        ],
      ),
    );
  }

  Widget createTextFromApi(){
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
      child: FutureBuilder(
        future: data,
        builder: (context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return Text(
              "Positif: ${snapshot.data[0]["positif"]}\nSembuh: ${snapshot.data[0]["sembuh"]}\nMeninggal: ${snapshot.data[0]["meninggal"]}\n"
            );
          }else{
            return CircularProgressIndicator();
          }
        },
      )
    );
  }

  Future getData() async {
    Network network = Network("https://api.kawalcorona.com/indonesia/");
    return network.fetchData();
  }
}