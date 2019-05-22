import 'package:flutter/foundation.dart' show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'localizations.dart';
import 'provider.dart';
import 'themes.dart';
import 'models/app_state.dart';
import 'modules/home_screen/home_screen.dart';

void main() async {
  // for flutter desktop embedding
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  SystemChannels.platform.setMockMethodCallHandler((MethodCall methodCall) async {
    print(methodCall.method);
    return Future.value(null);
  });
  runApp(
    SetCards()
  );
}

class SetCards extends StatefulWidget {

  AppStateObservable appState;

  SetCards() {
    appState = AppStateObservable(AppState());
  }

  @override
  SetCardsState createState() => SetCardsState();

}

class SetCardsState extends State<SetCards> {

  @override
  Widget build(BuildContext context) {
    return Provider(
      state: widget.appState,
      child: MaterialApp(
        title: 'set_cards',
        localizationsDelegates: [
          AppLocalizationsDelegate()
        ],
        routes: {
          '/': (context) => HomeScreen(),
        },
        builder: (BuildContext context, Widget child) => Theme(
          data: themes[Provider.of(context).value.theme ?? 'light'],
          child: child,
        ),
      ),
    );
  }

}
