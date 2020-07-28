import 'dart:async';
import 'package:flutter/material.dart';
import 'package:test_life/app/modules/home/bloc/bloc_drag_down.dart';

class PerfilPage extends StatefulWidget {
  bool animated;
  bool scroll;

  PerfilPage({this.animated, this.scroll});

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  bool anime = true;

  void animation() {
    Timer(Duration(milliseconds: 10), () {
      setState(() {
        anime = !anime;
      });
    });
  }

  @override
  void initState() {
    animation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: positionUpdated.stream,
        builder: (context, snaphot) {
          return AnimatedContainer(
            duration: Duration(milliseconds: widget.scroll ? 1 : 500),
            color: Theme.of(context).backgroundColor,
            width: MediaQuery.of(context).size.width,
            height: widget.scroll
                ? snaphot.data * MediaQuery.of(context).size.height
                : widget.animated == false
                ? anime ? 0.0 : MediaQuery.of(context).size.height
                : anime ? MediaQuery.of(context).size.height : 0.0,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Center(
                    child: Container(
                      width: 120.0,
                      height: 120.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/qrcode.png"),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.white.withOpacity(0.7),
                                  BlendMode.dstATop))),
                    ),
                  ),
                ),
                new Center(
                  child: Text(
                    "Sarah Kubitschek",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 15.0),
                  child: new Center(
                    child: Text(
                      "E-mail: sarah.kubitschek@gmail.com",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: new Divider(
                    color: Color.fromRGBO(145, 64, 169, 1.0),
                    height: 1.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: ListTile(
                    isThreeLine: false,
                    leading: Icon(
                      Icons.person_outline,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Perfil",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "Nome de preferência, telefone, e-mail",
                      style: TextStyle(color: Colors.green[200]),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: new Divider(
                    color: Color.fromRGBO(145, 64, 169, 1.0),
                    height: 10.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: ListTile(
                    isThreeLine: false,
                    leading: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Meus Testes",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: new Divider(
                    color: Color.fromRGBO(145, 64, 169, 1.0),
                    height: 10.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: ListTile(
                    isThreeLine: false,
                    leading: Icon(
                      Icons.smartphone,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Configurações do app",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: OutlineButton(
                    onPressed: () {},
                    child: Text(
                      "SAIR DO APP",
                      style: TextStyle(color: Colors.white),
                    ),
                    borderSide:
                    BorderSide(color: Color.fromRGBO(145, 64, 169, 1.0)),
                  ),
                )
              ],
            ),
          );
        });
  }
}
