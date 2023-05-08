import 'package:flutter/material.dart';

import '../animation/circle_button_animation.dart';
import '../bloc/bloc_controller.dart';

class CircleButton extends StatefulWidget {
  final double finalTop;
  final double finalRight;
  final double initState;
  final BlocController bloc;
  final Widget widget;
  final Duration duration;
  final Curve curve;
  final bool opacity;

  const CircleButton({
    Key? key,
    required this.finalTop,
    required this.finalRight,
    required this.initState,
    required this.bloc,
    this.duration = const Duration(milliseconds: 300),
    required this.widget,
    required this.curve,
    this.opacity = true,
  }) : super(key: key);

  @override
  State<CircleButton> createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton>
    with TickerProviderStateMixin, CircleButtonAnimation {
  @override
  Offset get finalOffset => Offset(widget.finalTop, widget.finalRight);

  @override
  Offset get initialOffset => Offset(widget.initState, widget.initState);

  @override
  BlocController get bloc => widget.bloc;

  @override
  Duration get duration => widget.duration;

  @override
  Curve get curve => widget.curve;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: positionAnimation,
      child: widget.widget,
      builder: (context, child) {
        return Positioned(
          top: positionAnimation.value.dy,
          left: positionAnimation.value.dx,
          child: widget.opacity == true
              ? Opacity(
                  opacity: controller.value,
                  child: child,
                )
              : child!,
        );
      },
    );
  }
}
