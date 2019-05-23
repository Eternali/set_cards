import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:tuple/tuple.dart';

class AnimatedBackground extends StatelessWidget {

  Duration duration;
  List<Tuple2<Color, Color>> colors;

  AnimatedBackground({
    this.duration = const Duration(seconds: 3),
    this.colors,
    Key key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween(colors.asMap().map((c, cs) => MapEntry<int, Track>(
      c,
      Track('color$c').add(
        duration,
        ColorTween(begin: cs.item1, end: cs.item2),
      ),
    )).values.toList());

    return ControlledAnimation(
      playback: Playback.MIRROR,
      tween: tween,
      duration: tween.duration,
      builder: (context, anim) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: List.generate(colors.length, (i) => anim['color$i']),
            ),
          ),
        );
      },
    );
  }

}
