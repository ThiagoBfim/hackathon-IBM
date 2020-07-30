import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MeusTestesPage extends StatefulWidget {
  final String title;

  const MeusTestesPage({Key key, this.title = "Meus Testes"}) : super(key: key);

  @override
  _MeusTestesPageState createState() => _MeusTestesPageState();
}

class _MeusTestesPageState extends State<MeusTestesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text("Meus Testes"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Container(
          child: ListView.separated(
              itemCount: 2,
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemBuilder: (BuildContext context, int index) {
                var element = _getList()[index];
                return Column(children: <Widget>[
                  _buildTestTile(context, element),
                ]);
              }),
        ),
      ),
    );
  }

  ListTile _buildTestTile(BuildContext context, TestMarcadoCovid element) {
    return ListTile(
      leading: Container(
        width: 50,
        child: Center(child: element.icon),
      ),
      title: Text(
        element.nomeTeste,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: Theme.of(context).textTheme.headline6.fontSize),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(element.localTeste,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Theme.of(context).textTheme.subtitle2.fontSize)),
          Text(
              "Data: ${new DateFormat('dd/MM/yyyy').format(element.dataTeste)}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Theme.of(context).textTheme.subtitle2.fontSize)),
        ],
      ),
    );
  }

  _getList() {
    return [
      TestMarcadoCovid(
          icon: Icon(Icons.timer),
          nomeTeste: "Teste rápido (IgM/IgG)",
          localTeste: "Ceilândia St. M QNM 17",
          dataTeste: DateTime.now()),
      TestMarcadoCovid(
          icon: Icon(Icons.timer_off),
          nomeTeste: "RT-PCR",
          localTeste: "BS Q 1 Bloco C Loja 16 D - Asa Sul",
          dataTeste: DateTime.now().subtract(Duration(days: 32))),
    ];
  }
}

class TestMarcadoCovid {
  final Icon icon;
  final String nomeTeste;
  final String localTeste;
  final DateTime dataTeste;

  TestMarcadoCovid(
      {this.icon, this.nomeTeste, this.localTeste, this.dataTeste});
}
