import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testlife/pages/home/root_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'COVID19',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        cardColor: Colors.green[300],
        backgroundColor: Colors.green[400],
      ),
      home: new RootPage(),
    );
  }
}
