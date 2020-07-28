import 'dart:async' show Future;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:testlife/pages/find_test_page.dart';

import 'ibm/watson_assistant_v2.dart';

class ChatBotPage extends StatefulWidget {
  @override
  _ChatBotPageState createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  String _watsonText = '';
  String _userInput = '';
  SmartCovidTest _testResult;

  Future<String> loadWatsonProperties() async {
    return await rootBundle.loadString('private-properties/config.json');
  }

  WatsonAssistantApiV2 watsonAssistant;
  WatsonAssistantResponse watsonAssistantResponse;
  WatsonAssistantContext watsonAssistantContext =
      WatsonAssistantContext(context: {});

  final responseController = TextEditingController();

  void _callWatsonAssistant() async {
    watsonAssistantResponse = await watsonAssistant.sendMessage(
        responseController.text, watsonAssistantContext);
    setState(() {
      _watsonText = watsonAssistantResponse.resultText;
      if (_watsonText.contains("resultado")) {
        _testResult = SmartCovidTest.create(_watsonText);
      }
      _userInput = '';
    });

    responseController.addListener(() {
      setState(() {
        _userInput = responseController.text;
      });
    });
    watsonAssistantContext = watsonAssistantResponse.context;
    responseController.clear();
  }

  @override
  void initState() {
    super.initState();
    initializeWatson();
  }

  Future initializeWatson() async {
    WatsonAssistantV2Credential _credential =
        WatsonAssistantV2Credential.fromJsonFile(await loadWatsonProperties());
    print(_credential.url);
    watsonAssistant =
        WatsonAssistantApiV2(watsonAssistantCredential: _credential);
    _callWatsonAssistant();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assistente Virtual'),
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildWatsonQuestion(context),
              SizedBox(
                height: 18.0,
              ),
              _buildInputUserField(),
              SizedBox(
                height: 80.0,
              ),
              _buildWatsonDefinition(context),
              SizedBox(
                height: 18.0,
              ),
              buildButtonMarcarTeste(),
            ],
          ),
        ),
      ),
      floatingActionButton: Visibility(
        visible: _userInput.isNotEmpty,
        child: FloatingActionButton(
          onPressed: _callWatsonAssistant,
          child: Icon(Icons.send),
        ),
      ),
    );
  }

  Visibility buildButtonMarcarTeste() {
    return Visibility(
      visible: _testResult != null ? _testResult.descricao?.isNotEmpty : false,
      child: RaisedButton(
        onPressed: sendToMarcarTeste,
        textColor: Colors.white,
        color: Colors.red,
        padding: const EdgeInsets.all(8.0),
        child: new Text(
          "Marcar Teste",
        ),
      ),
    );
  }

  sendToMarcarTeste() => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FindTestPage()),
      );

  Widget _buildWatsonQuestion(BuildContext context) {
    return Visibility(
      visible: _testResult == null ? true : false,
      child: Text(
        _watsonText.isNotEmpty ? _watsonText : 'Carregando...',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }

  Widget _buildWatsonDefinition(BuildContext context) {
    return Visibility(
      visible: _testResult != null ? _testResult.descricao?.isNotEmpty : false,
      child: Text(
        _testResult != null ? _testResult.descricao : "",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: _testResult?.getColorByRisk(),
            fontSize: Theme.of(context).textTheme.headline4.fontSize),
      ),
    );
  }

  TextField _buildInputUserField() {
    return TextField(
      controller: responseController,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Escreva seus sintomas',
        hintStyle: TextStyle(color: Colors.white),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green[700], width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green[700], width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }

  @override
  void dispose() {
    responseController.dispose();
    super.dispose();
  }
}

class SmartCovidTest {
  int risco; //0 - alto, 1 - medio, 2 - baixo
  String descricao;

  static SmartCovidTest create(String watsonText) {
    SmartCovidTest testeCovid = new SmartCovidTest();
    if (watsonText.contains("altas")) {
      testeCovid.risco = 0;
    } else if (watsonText.contains("médio")) {
      testeCovid.risco = 1;
    } else if (watsonText.contains("baixo")) {
      testeCovid.risco = 2;
    }
    testeCovid.descricao = watsonText;
    return testeCovid;
  }

  Color getColorByRisk() {
    switch (risco) {
      case 0:
        return Colors.red[800];
      case 1:
        return Colors.yellow[800];
      case 2:
        return Colors.blue[800];
      default:
        return Colors.white;
    }
  }
}
