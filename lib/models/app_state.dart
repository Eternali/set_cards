import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class AppState {

  final String theme;
  final List<Tuple2<Color, Color>> background;

  AppState({
    this.theme = 'light',
    this.background,
  });

  factory AppState.from(AppState prev) => AppState(
    theme: prev.theme,
    background: prev.background,
  );

  AppState copyWith({
    String theme,
    List<Tuple2<Color, Color>> background,
  }) => AppState(
    theme: theme ?? this.theme,
    background: background ?? this.background,
  );

  @override
  int get hashCode => theme.hashCode +
    background.hashCode;

}

class AppStateObservable extends ValueNotifier<AppState> {

  AppStateObservable(AppState value) : super(value);

}
