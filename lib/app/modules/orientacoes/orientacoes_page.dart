import 'package:flutter/material.dart';
import 'package:test_life/app/modules/chat_bot/chat_bot_page.dart';

class OrientacoesPage extends StatefulWidget {
  final String title;
  final SmartCovidTest testResult;

  const OrientacoesPage({Key key, this.title = "Orientações", this.testResult})
      : super(key: key);

  @override
  _OrientacoesPageState createState() => _OrientacoesPageState();
}

class _OrientacoesPageState extends State<OrientacoesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: _buildRiscos(context),
    );
  }

  Widget _buildRiscos(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          "Seu caso é de risco ${widget.testResult.nomeRisco}",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: Theme.of(context).textTheme.headline4.fontSize),
        ),
        SizedBox(height: 18.0),
        Text(
          "Orientações:",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: Theme.of(context).textTheme.headline6.fontSize),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Text(
            _buildOrientacoes(),
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.white,
                fontSize: Theme.of(context).textTheme.subtitle1.fontSize),
          ),
        ),
        Visibility(
          visible: widget.testResult.risco == 3,
          child: Text(
            "Em caso de piore, refaça o teste ou busque suporte médico",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: Theme.of(context).textTheme.headline6.fontSize),
          ),
        ),
      ],
    );
  }

  String _buildOrientacoes() {
    var risco = widget.testResult.risco;
    switch (risco) {
      case 0:
        return "- Busque atendimento em uma unidade de saúde."
            "\n\n- Utilize máscara e cuidado com o próximo.";
      case 1:
        return "- Busque fazer uma unidade de saúde para fazer o teste."
            "\n\n- Utilize máscara e cuidado com o próximo."
            "\n\n- Caso você esteja com COVID, deve manter o isolamento por 14 dias até a remissão da infecção.";
      case 2:
        return "- Tome 2 litros de água por dia;"
            "\n\n- Use dois travesseiros para manter a cabeça elevada e facilitar a respiração;"
            "\n\n- Use compressas mornas no rosto para abrir os seios nasais e facilitar a respiração se estiver com nariz entupido;"
            "\n\n- Tome vitamina C através de sucos de limão e chá com limão e mel;"
            "\n\n- Tenha uma alimentação equilibrada;"
            "\n\n- Repouse; "
            "\n\n- Mantenha o isolamento social."
            "\n\n- Caso você esteja com COVID, deve manter o isolamento por 14 dias até a remissão da infecção.";
      default:
        return "- Tome 2 litros de água por dia;"
            "\n\n- Use dois travesseiros para manter a cabeça elevada e facilitar a respiração;"
            "\n\n- Use compressas mornas no rosto para abrir os seios nasais e facilitar a respiração se estiver com nariz entupido;"
            "\n\n- Tome vitamina C através de sucos de limão e chá com limão e mel;"
            "\n\n- Tenha uma alimentação equilibrada;"
            "\n\n- Repouse; "
            "\n\n- Mantenha o isolamento social."
            "\n\n- Caso você esteja com COVID, deve manter o isolamento por 14 dias até a remissão da infecção.";
    }
  }
}
