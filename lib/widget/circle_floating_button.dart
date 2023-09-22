import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../bloc/bloc_controller.dart';
import 'circle_button.dart';

class CircleFloatingButton extends StatefulWidget {
  final List<Widget> items;
  final double radius;
  final Position position;
  final double? right;
  final double? top;
  final bool completeCircle;
  final CircleType type;
  final Duration duration;
  final Color buttonColor;
  final IconData buttonIcon;
  final Color iconColor;
  final Curve curve;
  final bool opacity;
  final Widget? child;

  CircleFloatingButton({
    Key? key,
    required this.items,
    this.radius = 100,
    this.position = Position.right,
    this.right,
    this.top,
    this.completeCircle = false,
    this.duration = const Duration(milliseconds: 300),
    required this.type,
    required this.buttonColor,
    required this.buttonIcon,
    required this.iconColor,
    required this.curve,
    required this.opacity,
    this.child,
  }) : super(key: key ?? UniqueKey());

  factory CircleFloatingButton.floatingActionButton({
    required List<Widget> items,
    double radius = 100,
    required Duration duration,
    required IconData icon,
    required Color iconColor,
    required Color color,
    required Curve curveAnim,
    required bool useOpacity,
    Key? key,
    Widget? child,
  }) {
    return CircleFloatingButton(
      items: items,
      key: key,
      radius: radius,
      position: Position.bottom,
      type: CircleType.quarterPart,
      duration: duration,
      buttonIcon: icon,
      iconColor: iconColor,
      buttonColor: color,
      curve: curveAnim,
      opacity: useOpacity,
      child: child,
    );
  }

  factory CircleFloatingButton.completeCircle({
    required List<Widget> items,
    double radius = 100,
    required Duration duration,
    required IconData icon,
    required Color color,
    required Color iconColor,
    required Curve curveAnim,
    required bool useOpacity,
    Key? key,
    required Widget child,
  }) {
    return CircleFloatingButton(
      items: items,
      radius: radius,
      position: Position.bottom,
      type: CircleType.complete,
      duration: duration,
      buttonIcon: icon,
      iconColor: iconColor,
      buttonColor: color,
      curve: curveAnim,
      opacity: useOpacity,
      key: key,
      child: child,
    );
  }

  factory CircleFloatingButton.semiCircle({
    required List<Widget> items,
    Key? key,
    double radius = 100,
    required Position position,
    required Duration duration,
    required IconData icon,
    required Color color,
    required Curve curveAnim,
    required bool useOpacity,
    Widget? child,
  }) {
    return CircleFloatingButton(
      items: items,
      radius: radius,
      position: position,
      type: CircleType.semi,
      duration: duration,
      buttonIcon: icon,
      iconColor: color,
      buttonColor: color,
      curve: curveAnim,
      opacity: useOpacity,
      key: key,
      child: child,
    );
  }

  @override
  CircleFloatingButtonState createState() => CircleFloatingButtonState();
}

class CircleFloatingButtonState extends State<CircleFloatingButton> {
  late final BlocController _bloc;
  GlobalKey containerKey = GlobalKey();

  void close() {
    _bloc.close();
  }

  void toggle() {
    _bloc.toggle();
  }

  @override
  void initState() {
    super.initState();
    _bloc = BlocController();
  }

  Offset _getOffset(double angle, double radius) {
    final radians = math.pi * angle / 180.0;
    final x = radius * math.cos(radians) * -1;
    final y = radius * math.sin(radians) * -1;
    return Offset(x, y);
  }

  int getRotatePosition(Position postion) {
    switch (postion) {
      case Position.right:
        return 90;
      case Position.bottom:
        return 180;
      case Position.left:
        return 270;
      case Position.top:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case CircleType.semi:
        return semi();
      case CircleType.complete:
        return complete();
      case CircleType.quarterPart:
        return quarterPart();
    }
  }

  Widget quarterPart() {
    final quantity = widget.items.length;
    return SizedBox(
      width: 60 + widget.radius,
      height: 60 + widget.radius,
      child: Stack(
        children: List.generate(
          quantity,
          (index) {
            final angulo = (90) / (quantity - 1) * index;

            return CircleButton(
              finalRight: _getOffset(
                    angulo + getRotatePosition(widget.position),
                    -widget.radius,
                  ).dy +
                  widget.radius,
              finalTop: _getOffset(
                    angulo + getRotatePosition(widget.position),
                    -widget.radius,
                  ).dx +
                  widget.radius,
              initState: widget.radius,
              bloc: _bloc,
              widget: widget.items[index],
              duration: widget.duration,
              curve: widget.curve,
              opacity: widget.opacity,
            );
          },
        )..add(
            Positioned(
              top: widget.radius,
              left: widget.radius,
              child: widget.child != null
                  ? Material(
                      child: InkWell(
                        onTap: _bloc.toggle,
                        child: widget.child,
                      ),
                    )
                  : FloatingActionButton(
                      heroTag: UniqueKey(),
                      backgroundColor: widget.buttonColor,
                      onPressed: _bloc.toggle,
                      child: Icon(widget.buttonIcon, color: widget.iconColor),
                    ),
            ),
          ),
      ),
    );
  }

  Widget complete() {
    final quantity = widget.items.length;
    return Stack(
      children: List.generate(
        quantity,
        (index) {
          final angulo = (360) / quantity * index;

          return CircleButton(
            finalRight: _getOffset(
                  angulo + getRotatePosition(widget.position),
                  -widget.radius,
                ).dy +
                widget.radius,
            finalTop: _getOffset(
                  angulo + getRotatePosition(widget.position),
                  -widget.radius,
                ).dx +
                widget.radius,
            initState: widget.radius,
            bloc: _bloc,
            duration: widget.duration,
            curve: widget.curve,
            opacity: widget.opacity,
            widget: widget.items[index],
          );
        },
      )..add(
          Positioned(
            top: widget.radius,
            left: widget.radius,
            child: Container(
              child: widget.child != null
                  ? Material(
                      child: Center(
                        child: InkWell(
                          onTap: _bloc.toggle,
                          child: widget.child,
                        ),
                      ),
                    )
                  : FloatingActionButton(
                      heroTag: UniqueKey(),
                      backgroundColor: widget.buttonColor,
                      onPressed: _bloc.toggle,
                      child: Icon(widget.buttonIcon, color: widget.iconColor),
                    ),
            ),
          ),
        ),
    );
  }

  Widget semi() {
    final quantity = widget.items.length;

    return Stack(
      children: List.generate(
        quantity,
        (index) {
          final angulo = (180) / (quantity - 1) * index;

          return CircleButton(
            finalRight: _getOffset(
                  angulo + getRotatePosition(widget.position),
                  -widget.radius,
                ).dy +
                widget.radius,
            finalTop: _getOffset(
                  angulo + getRotatePosition(widget.position),
                  -widget.radius,
                ).dx +
                widget.radius,
            initState: widget.radius,
            bloc: _bloc,
            curve: widget.curve,
            duration: widget.duration,
            opacity: widget.opacity,
            widget: widget.items[index],
          );
        },
      )..add(
          Positioned(
            top: widget.radius,
            left: widget.radius,
            child: widget.child != null
                ? Material(
                    child: InkWell(
                      onTap: _bloc.toggle,
                      child: widget.child,
                    ),
                  )
                : FloatingActionButton(
                    heroTag: UniqueKey(),
                    backgroundColor: widget.buttonColor,
                    onPressed: _bloc.toggle,
                    child: Icon(widget.buttonIcon, color: widget.iconColor),
                  ),
          ),
        ),
    );
  }
}

enum CircleType {
  semi,
  complete,
  quarterPart,
}

enum Position {
  right,
  left,
  top,
  bottom,
}
