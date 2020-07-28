import 'package:flutter/material.dart';
import 'package:testlife/pages/chat_bot_page.dart';
import 'package:testlife/pages/home/bloc/bloc_home.dart';
import 'package:testlife/pages/home/widgets/card_bottom.dart';
import 'package:testlife/pages/perfil_page.dart';
import 'package:testlife/pages/sintomas_page.dart';
import 'package:testlife/pages/web_view_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  BlocHome bloc = BlocHome();

  AnimationController controller;
  Animation animOpacity;
  Animation animOpacityHome;
  Animation animTranslate;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animOpacity = Tween(begin: 0.0, end: 1.0).animate(controller);
    animOpacityHome = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.0, 0.1)));
    animOpacityHome.addListener(() {
      setState(() {});
    });
    animTranslate = Tween(begin: 0.0, end: 470.0).animate(controller);
    animTranslate.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    bloc.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: <Widget>[
          Visibility(
            visible: false,
            child: AnimatedBuilder(
              animation: animOpacity,
              builder: (BuildContext context, Widget child) {
                return Opacity(
                    opacity: animOpacity.value,
                    child: PerfilPage(
                      animated: false,
                      scroll: false,
                    ));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
                child: GridView.count(
                    crossAxisCount: 2,
                    scrollDirection: Axis.vertical,
                    children: List.generate(6, (index) {
                      return CardBottom(getCardBottomButton()[index]);
                    }))),
          ),
        ],
      ),
    );
  }

  List<CardBottomModel> getCardBottomButton() {
    return [
      CardBottomModel(
          Icons.favorite, 'Marcar o teste', () => sendToChatBotPage()),
      CardBottomModel(Icons.colorize, 'Marcar a vacina',
          () => showSnackBarEmDesenvolvimento()),
      CardBottomModel(Icons.warning, 'Estou com COVID?', sendToSintomasCovid),
      CardBottomModel(Icons.airline_seat_flat, 'Peguei COVID e agora?',
          () => showSnackBarEmDesenvolvimento()),
      CardBottomModel(Icons.people, 'Como se transmite', sendToComoSeTransmite),
      CardBottomModel(
          Icons.multiline_chart, 'Numero de casos', sendToNumeroCasos)
    ];
  }



  sendToChatBotPage() => Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => ChatBotPage()),
  );

  showSnackBarEmDesenvolvimento() =>
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(
          "Em desenvolvimento",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        duration: Duration(milliseconds: 2500),
        backgroundColor: Colors.red[900],
      ));

  sendToSintomasCovid() => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SintomasPage(
                title: "Sintomas",
                imageAssetUrl: "assets/covid-sintomas.jpeg")),
      );

  sendToNumeroCasos() => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WebViewPage(
                title: "WorldMeters",
                url: "https://www.worldometers.info/coronavirus/")),
      );

  sendToComoSeTransmite() => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WebViewPage(
                title: "Transmissão",
                url: "https://coronavirus.es.gov.br/#transmissao")),
      );
}

class CardBottomModel {
  final IconData icon;
  final String title;
  final Function redirectFunction;

  CardBottomModel(this.icon, this.title, this.redirectFunction);
}
