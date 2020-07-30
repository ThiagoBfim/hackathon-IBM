import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));

    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    return new MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('pt', 'BR'),
      ],
      locale: Locale('pt', 'BR'),
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
