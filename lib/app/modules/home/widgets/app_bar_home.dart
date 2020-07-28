import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget {
  final bool isPerfilSelected;

  AppBarHome(this.isPerfilSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: new Column(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/covid.webp",
                  width: 50.0,
                  height: 30.0,
                  fit: BoxFit.fitHeight,
                ),
                new Text(
                  "Sarah",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.06),
                )
              ],
            ),
            Center(
              child: isPerfilSelected
                  ? Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    )
                  : Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.white,
                    ),
            )
          ],
        ),
      ),
    );
  }
}
