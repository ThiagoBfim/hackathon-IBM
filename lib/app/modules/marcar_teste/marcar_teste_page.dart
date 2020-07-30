import 'package:flutter/material.dart';
import 'package:test_life/app/modules/find_test/model/teste_covid.dart';

class MarcarTestePage extends StatefulWidget {
  final TestCovid testCovid;

  const MarcarTestePage({
    Key key,
    this.testCovid,
  }) : super(key: key);

  @override
  _MarcarTestePageState createState() => _MarcarTestePageState();
}

class _MarcarTestePageState extends State<MarcarTestePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(widget.testCovid.title),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 8, right: 8, bottom: 6, top: 6),
              height: 180,
              decoration: _buildBoxShadow(),
            ),
            SizedBox(height: 20.0),
            Text(
              "Testes disponiveis: ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Theme.of(context).textTheme.headline5.fontSize),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.separated(
                  itemCount: 3,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    var element = getList()[index];
                    return Column(children: <Widget>[
                      _buildTestTile(context, element),
                    ]);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  ListTile _buildTestTile(BuildContext context, TestCovidDetail element) {
    return ListTile(
      leading: Container(
        width: 50,
        child: Center(child: element.icon),
      ),
      title: Text(
        element.nome,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: Theme.of(context).textTheme.headline6.fontSize),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Preço R\$: ${element.price}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Theme.of(context).textTheme.subtitle2.fontSize)),
          Text(element.restricoes,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Theme.of(context).textTheme.subtitle2.fontSize)),
          element.confiabilidade,
          Text("Quantidade disponível: ${element.qtdVacinaDisponivel}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Theme.of(context).textTheme.subtitle2.fontSize)),
        ],
      ),
    );
  }

  BoxDecoration _buildBoxShadow() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        color: Colors.blueGrey,
        boxShadow: [buildBoxShadow(3.0)],
        image: buildDecorationImage());
  }

  DecorationImage buildDecorationImage() {
    return DecorationImage(
        fit: BoxFit.cover,
        colorFilter: new ColorFilter.mode(
            Colors.white.withOpacity(0.8), BlendMode.dstATop),
        image: AssetImage("assets/sabin.jpg"));
  }

  BoxShadow buildBoxShadow(double verticalMove) {
    return BoxShadow(
      color: Colors.grey[800],
      blurRadius: 1.0,
      spreadRadius: 1.0,
      offset: Offset(
        1.0, // horizontal move
        verticalMove, // vertica move
      ),
    );
  }
}

List<TestCovidDetail> getList() {
  return [
    TestCovidDetail(
        Row(
          children: <Widget>[
            Icon(Icons.money_off),
          ],
        ),
        "Teste rápido (IgM/IgG)",
        Row(
          children: <Widget>[
            Text("Confiabilidade:",
                style: TextStyle(
                  color: Colors.white,
                )),
            Icon(
              Icons.star,
              color: Colors.yellow,
            ),
          ],
        ),
        "Recomendada com mais de 8 dias de sintomas",
        0,
        50),
    TestCovidDetail(
        Row(
          children: <Widget>[
            Icon(Icons.monetization_on),
          ],
        ),
        "Sorologico",
        Row(
          children: <Widget>[
            Text("Confiabilidade:",
                style: TextStyle(
                  color: Colors.white,
                )),
            Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            Icon(
              Icons.star,
              color: Colors.yellow,
            ),
          ],
        ),
        "Recomendada com 7 a 11 dias de sintomas",
        200,
        50),
    TestCovidDetail(
        Row(
          children: <Widget>[
            Icon(Icons.monetization_on),
            Icon(Icons.monetization_on),
          ],
        ),
        "RT-PCR",
        Row(
          children: <Widget>[
            Text("Confiabilidade:",
                style: TextStyle(
                  color: Colors.white,
                )),
            Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            Icon(
              Icons.star,
              color: Colors.yellow,
            ),
          ],
        ),
        "Precisa de prescrição médica\nRecomendada com 3 a 10 dias de sintomas",
        500,
        100),
  ];
}

class TestCovidDetail {
  final Widget icon;
  final String nome;
  final Widget confiabilidade;
  final String restricoes;
  final double price;
  final int qtdVacinaDisponivel;

  TestCovidDetail(this.icon, this.nome, this.confiabilidade, this.restricoes,
      this.price, this.qtdVacinaDisponivel);
}
