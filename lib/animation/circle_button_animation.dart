import 'package:flutter/material.dart';

import '../bloc/bloc_controller.dart';

mixin CircleButtonAnimation<T extends StatefulWidget>
    on State<T>, TickerProviderStateMixin<T> {
  AnimationController controller;
  Animation<Offset> positionAnimation;

  Offset get initialOffset;
  Offset get finalOffset;
  BlocController get bloc;
  Duration get duration;
  Curve get curve;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: duration, vsync: this);
    positionAnimation = Tween<Offset>(
      begin: initialOffset,
      end: finalOffset,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0,
          0.9,
          curve: curve ?? Curves.easeOut,
        ),
      ),
    );

    bloc.opened.listen((value) {
      if (value) {
        controller.forward();
      } else {
        controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
