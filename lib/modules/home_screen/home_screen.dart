import 'package:flutter/material.dart';

import 'package:set_cards/localizations.dart';
import 'package:set_cards/provider.dart';
import 'intents.dart';
import 'widgets/mode_button.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({ Key key }) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final locales = AppLocalizations.of(context);
    final state = Provider.of(context).value;
    final theme = Theme.of(context);

    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment(0, -0.5),
          child: Text(
            locales.title,
            style: theme.textTheme.display4.copyWith(
              color: Colors.white70,
              letterSpacing: 10,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ModeButton(
                title: locales.solo,
                icon: Icons.person,
                onPressed: () => Navigator.of(context).pushNamed('/game'),
              ),
              ModeButton(
                title: locales.live,
                icon: Icons.people,
                onPressed: () => Intents.launchLive(Provider.of(context)),
              ),
              ModeButton(
                title: locales.turns,
                icon: Icons.av_timer,
                onPressed: () => Intents.launchTurns(Provider.of(context)),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.bubble_chart, color: Colors.white70, size: 28),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.settings, color: Colors.white70, size: 28),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

}