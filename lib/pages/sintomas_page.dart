import 'dart:async';
import 'package:testlife/pages/home/bloc/bloc_drag_down.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SintomasPage extends StatefulWidget {
  final String title;
  final String imageAssetUrl;

  const SintomasPage({Key key, this.title, this.imageAssetUrl})
      : super(key: key);

  @override
  _SintomasPageState createState() =>
      _SintomasPageState(title, imageAssetUrl);
}

class _SintomasPageState extends State<SintomasPage> {
  TextEditingController numController = new TextEditingController();
  final String title;
  final String imageAssetUrl;
  int result = 0;

  _SintomasPageState(this.title, this.imageAssetUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 30.0),
          child: Column(
            children: <Widget>[
              Image.asset(
                imageAssetUrl,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Text(
                    "Somatório:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Flexible(
                    child: new TextField(
                      keyboardType: TextInputType.number,
                      controller: numController,
                    ),
                  ),
                  RaisedButton(
                    child: Text("Somar"),
                    onPressed: () => somar(),
                    color: Colors.green,
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    splashColor: Colors.green[700],
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    'Resultado: $result',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              RaisedButton(
                child: Text("Limpar", style: TextStyle(fontSize: 22.0),),
                onPressed: () => limpar(),
                color: Colors.blue,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Colors.blue[700],
              )
            ],
          ),
        ),
      ),
    );
  }

  somar() {
    setState(() {
      result += int.parse(numController.text);
      numController.text = "";
    });
  }

  limpar() {
    setState(() {
      result = 0;
      numController.text = "";
    });
  }
}
