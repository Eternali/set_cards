import 'dart:async';
import 'package:flutter/material.dart';

class AppLocalizations {

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get live => 'Live';
  String get score => 'Score';
  String get solo => 'Solo';
  String get title => 'SET';
  String get turns => 'Turns';
  
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {

  @override
  Future<AppLocalizations> load(Locale locale) {
    return Future(() => AppLocalizations());
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;

  @override
  bool isSupported(Locale locale) => locale.languageCode.toLowerCase().contains('en');

}
