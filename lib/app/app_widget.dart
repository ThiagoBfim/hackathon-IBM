import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'COVID-19',
      navigatorKey: Modular.navigatorKey,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        cardColor: Colors.green[300],
        backgroundColor: Colors.green[400],
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
