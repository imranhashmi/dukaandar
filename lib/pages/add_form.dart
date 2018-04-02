import 'package:flutter/material.dart';
import 'package:dukandaar/strings.dart';

import 'package:dukandaar/datamodel/survey.dart';

class AddForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: new Text(Strings.addTitle),
        leading: new IconButton(
          icon: new Icon(Icons.close),
          onPressed: (){ Navigator.pop(context, null); },
        ),
      ),
      body: new Container(
        padding: new EdgeInsets.fromLTRB(10.0, 100.0, 10.0, 10.0),        
        child: new Column(
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration(
                hintText: "Enter name"
              ),
            ),
            new TextField(
              decoration: new InputDecoration(
                hintText: "Enter description"
              ),
            ),
            new IconButton(
              icon: new Icon(Icons.done, color: Colors.green, size: 48.0),
              onPressed: () {
                final item = new Survey("dummy","add form item");
                Navigator.pop(context, item); }
            ), 
          ],
        ),
      )
    );
  }
}