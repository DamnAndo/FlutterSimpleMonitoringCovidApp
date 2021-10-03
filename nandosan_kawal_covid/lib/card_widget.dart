import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String content;

  CardWidget(this.title, this.content);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 15, top: 15),
              child: Text(
                this.title,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              )),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(15),
                child: Icon(Icons.people),
              ),
              Text(this.content, style: TextStyle(fontSize: 20))
            ],
          )
        ],
      ),
    );
  }
}
