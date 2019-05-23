import 'package:flutter/material.dart';

import 'package:set_cards/localizations.dart';

class GameScreen extends StatefulWidget {

  GameScreen({ Key key }) : super(key: key);

  _GameScreenState createState() => _GameScreenState();

}

class _GameScreenState extends State<GameScreen> {

  @override
  Widget build(BuildContext context) {
    final locales = AppLocalizations.of(context);

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              locales.score,
            ),
            MaterialButton(
              child: Text('BACK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ],
    );
  }

}