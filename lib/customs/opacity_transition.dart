import 'package:flutter/material.dart';

class OpacityTransition extends AnimatedWidget {

  const OpacityTransition({
    Key key,
    @required Animation<double> opacity,
    this.child,
  }) : assert(opacity != null), super(key: key, listenable: opacity);

  Animation<double> get opacity => listenable;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity.value,
      child: child,
    );
  }

}