import 'package:flutter/material.dart';

final themes = {
  'light': ThemeData.light().copyWith(
    primaryColor: Colors.grey[600],
    accentColor: Colors.amber,
  ),
  'dark': ThemeData.dark().copyWith(
    primaryColor: Colors.grey[600],
    accentColor: Colors.amberAccent,
  ),
};
