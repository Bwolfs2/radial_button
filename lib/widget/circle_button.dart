import 'package:flutter/material.dart';
import 'package:radial_button/bloc/bloc_controller.dart';

import 'package:radial_button/animation/circle_button_animation.dart';

class CircleButton extends StatefulWidget {
  final double finalTop;
  final double finalRight;
  final double initState;
  final BlocController bloc;
  final Widget widget;
  final Duration duration;
  final Curve curve;
  final bool opacity;

  CircleButton(
      {Key key,
      this.finalTop,
      this.finalRight,
      this.initState,
      this.bloc,
      this.duration = const Duration(milliseconds: 300),
      this.widget,
      this.curve,
      this.opacity = true})
      : super(key: key);

  @override
  _CircleButtonState createState() => _CircleButtonState();
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
  Duration get duration => widget.duration ?? Duration(milliseconds: 300);

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
          child: widget.opacity == null || widget.opacity
              ? Opacity(
                  opacity: controller.value,
                  child: child,
                )
              : child,
        );
      },
    );
  }
}
