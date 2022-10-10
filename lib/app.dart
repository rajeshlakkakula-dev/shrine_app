import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shrine_app/home.dart';
import 'package:shrine_app/login.dart';

class ShrineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => LoginPage(),
        '/': (BuildContext context) => HomePage()
      },
    );
  }
}
