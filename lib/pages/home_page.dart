import 'package:flutter/material.dart';
import 'package:dukandaar/strings.dart';

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData.dark(),
      home: new Scaffold(
            appBar: new AppBar(
              leading: new IconButton(
                icon: new Icon(Icons.menu),
                onPressed: null,
              ),
              title: new Text(Strings.homeTitle),
            ),
            body: new Center(
              child: new FlatButton(
                child: new Text('Click here to start!'),
                onPressed: null,
              ),
            ),
          )
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  createState() => new HomePageState();
}