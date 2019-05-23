import 'package:flutter/material.dart';

import 'opacity_transition.dart';

class FadePageRoute<T> extends MaterialPageRoute<T> {

  FadePageRoute({
    WidgetBuilder builder,
    RouteSettings settings,
    Duration transitionDuration
  }) : transitionDuration = transitionDuration, super(builder: builder, settings: settings);

  @override
  final Duration transitionDuration;

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(              
      position: Tween(                                
        begin: const Offset(0.0, 1.0),                                                                                                                                                                  
        end: Offset.zero,
      ).animate(CurvedAnimation(                                                                                                                                                                        
        curve: Curves.easeInOut,     
        parent: animation,
      )),
      child: SlideTransition(
        position: Tween(
          begin: Offset.zero,
          end: const Offset(0.0, -0.04),
        ).animate(CurvedAnimation(
          curve: Curves.easeOut,
          parent: secondaryAnimation,
        )),
        child: child,
      ),
    );
    // return child;
    // return OpacityTransition(
    //   opacity: Tween<double>(
    //     begin: 1,
    //     end: 0,
    //   ).animate(
    //     CurvedAnimation(
    //       parent: animation,
    //       curve: Interval(0, 0.5, curve: Curves.linear),
    //     ),
    //   ),
    //   child: OpacityTransition(
    //     opacity: Tween<double>(
    //       begin: 0,
    //       end: 1,
    //     ).animate(
    //       CurvedAnimation(
    //         parent: secondaryAnimation,
    //         curve: Interval(0.5, 1, curve: Curves.linear),
    //       ),
    //     ),
    //     child: child,
    //   ),
    // );
  }

}
