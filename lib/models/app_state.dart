import 'package:flutter/material.dart';

class AppState {

  final String theme;

  AppState({
    this.theme = 'light',
  });

  factory AppState.from(AppState prev) => AppState(
    theme: prev.theme,
  );

  AppState copyWith({
    String theme,
  }) => AppState(
    theme: theme ?? this.theme,
  );

  @override
  int get hashCode => theme.hashCode;

}

class AppStateObservable extends ValueNotifier<AppState> {

  AppStateObservable(AppState value) : super(value);

}
