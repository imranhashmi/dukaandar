import "package:flutter/material.dart";

import 'package:dukandaar/pages/login_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData.dark(),
      home: new LoginPage(),
    );
  }
}