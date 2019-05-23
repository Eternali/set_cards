import 'package:flutter/foundation.dart' show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tuple/tuple.dart';

import 'localizations.dart';
import 'provider.dart';
import 'themes.dart';
import 'customs/fade_pageroute.dart';
import 'models/app_state.dart';
import 'modules/animated_background/animated_background.dart';
import 'modules/home_screen/home_screen.dart';
import 'modules/game_screen/game_screen.dart';

void main() async {
  // for flutter desktop embedding
  // debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  // SystemChannels.platform.setMockMethodCallHandler((MethodCall methodCall) async {
  //   print(methodCall.method);
  //   return Future.value(null);
  // });
  runApp(
    SetCards()
  );
}

class SetCards extends StatefulWidget {

  AppStateObservable appState;

  SetCards() {
    appState = AppStateObservable(AppState(
      background: [
        Tuple2(Color(0xff75d8ae), Color(0xffd0d97b)),
        Tuple2(Color(0xff2ecedb), Color(0xff3b4f9f)),
        Tuple2(Color(0xff9795EF), Color(0xffF9C5D1)),
      ],
    ));
  }

  @override
  SetCardsState createState() => SetCardsState();

}

class SetCardsState extends State<SetCards> {

  final routes = {
    '/': (BuildContext context) => HomeScreen(),
    '/game': (BuildContext context) => GameScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return Provider(
      state: widget.appState,
      child: MaterialApp(
        title: 'set_cards',
        localizationsDelegates: [
          AppLocalizationsDelegate()
        ],
        routes: routes,
        builder: (BuildContext context, Widget child) => Theme(
          data: themes[Provider.of(context).value.theme ?? 'light'],
          child: Scaffold(
            body: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: AnimatedBackground(
                    duration: const Duration(seconds: 6),
                    colors: Provider.of(context).value.background,
                  ),
                ),
                Positioned.fill(child: child),
              ],
            ),
          ),
        ),
        onGenerateRoute: (settings) {
          return FadePageRoute(
            settings: settings,
            builder: routes[settings.name],
            transitionDuration: const Duration(milliseconds: 600),
          );
        },
      ),
    );
  }

}
