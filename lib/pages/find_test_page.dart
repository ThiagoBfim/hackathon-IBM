import 'package:flutter/material.dart';

class FindTestPage extends StatefulWidget {
  @override
  _FindTestPageState createState() => _FindTestPageState();
}

class _FindTestPageState extends State<FindTestPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController _searchQueryController = TextEditingController();
  String searchQuery = "";

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _searchQueryController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _searchQueryController.addListener(() {
      //use setState to rebuild the widget
      setState(() {
        searchQuery = _searchQueryController.text;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        leading: const BackButton(),
        title: _buildSearchField(),
        actions: _buildActions(),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: cardsTest().length,
                    itemBuilder: (BuildContext context, int index) {
                      var card = cardsTest()[index];
                      return Card(
                        child: ListTile(
                          onTap: sendToMarcarTeste,
                          leading: Container(
                            decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(30.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.green.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: card.icon),
                          ),
                          title: Text('${card.title}'),
                          subtitle: Text('${card.subtitle}'),
                        ),
                      );
                    })),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchQueryController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Pesquisar",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white38),
      ),
      style: TextStyle(color: Colors.white, fontSize: 16.0),
    );
  }

  List<Widget> _buildActions() {
    return <Widget>[
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          _clearSearchQuery();
        },
      ),
    ];
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQueryController.clear();
    });
  }

  List<CardTest> cardsTest() {
    var cards = [
      CardTest(
          "Drive-Thru",
          "Estácionamento UNIEURO - Av. das Castanheiras - Águas Claras",
          Icon(
            Icons.directions_car,
            color: Colors.brown[700],
          )),
      CardTest(
          "Laboratório Sabin",
          "Ceilândia St. M QNM 17",
          Icon(
            Icons.local_hospital,
            color: Colors.redAccent,
          )),
      CardTest(
          "Laboratório Sabin",
          "BS Q 1 Bloco C Loja 16 D - Asa Sul",
          Icon(
            Icons.local_hospital,
            color: Colors.redAccent,
          )),
      CardTest(
          "Parque da Cidade",
          "Estacionamento 4 - CES - Brasília, DF, 70297-400",
          Icon(
            Icons.directions_car,
            color: Colors.brown[700],
          )),
    ];
    return cards
        .where((element) =>
            element.title.toUpperCase().contains(searchQuery.toUpperCase()) ||
            element.subtitle.toUpperCase().contains(searchQuery.toUpperCase()))
        .toList();
  }

  void sendToMarcarTeste() {
    //TODO implementar
  }
}

class CardTest {
  final Icon icon;
  final String title;
  final String subtitle;

  CardTest(this.title, this.subtitle, this.icon);
}
