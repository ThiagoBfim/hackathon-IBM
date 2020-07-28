import 'package:flutter/material.dart';
import 'package:icon_shadow/icon_shadow.dart';

import '../home_page.dart';

class CardBottom extends StatelessWidget {
  final CardBottomModel cardBottomModel;

  CardBottom(this.cardBottomModel);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cardBottomModel.redirectFunction,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Theme.of(context).cardColor,
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width * 0.29,
              maxWidth: MediaQuery.of(context).size.width * 0.29,
              maxHeight: MediaQuery.of(context).size.height * 0.15),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconShadowWidget(
                  Icon(
                    cardBottomModel.icon,
                    size: 60.0,
                    color: Colors.white,
                  ),
                  shadowColor: Colors.grey[700]),
              Text(
                cardBottomModel.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(1.5, 1.5),
                      blurRadius: 3.0,
                      color: Colors.grey[700],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
