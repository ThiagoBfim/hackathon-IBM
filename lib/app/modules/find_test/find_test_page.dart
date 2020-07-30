import 'package:flutter/material.dart';
import 'package:test_life/app/modules/find_test/model/teste_covid.dart';
import 'package:test_life/app/modules/find_test/repository/teste_covid_repository.dart';
import 'package:test_life/app/modules/marcar_teste/marcar_teste_page.dart';

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
                    itemCount: CardRepository.cardsTest(searchQuery).length,
                    itemBuilder: (BuildContext context, int index) {
                      var card = CardRepository.cardsTest(searchQuery)[index];
                      return Card(
                        child: ListTile(
                          onTap: () => sendToMarcarTeste(card),
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
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('${card.subtitle}'),
                              Text('Testes disponíveis: PCR/sorologia/teste-rápido'),
                              Text('Preço médio: ${card.precoMedio()} '),
                            ],
                          ),
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

  sendToMarcarTeste(TestCovid card) => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MarcarTestePage(testCovid: card)),
  );

}
