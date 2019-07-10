import 'package:flutter/material.dart';
import 'package:radial_button/bloc/bloc_controller.dart';
import 'dart:math' as math;
import 'circle_button.dart';

class CircleFloatingButton extends StatefulWidget {
  final List<Widget> items;
  final double radius;

  final Position position;
  final double right;
  final double top;
  final bool completeCircle;
  final CircleType type;
  final Duration duration;
  final Color buttonColor;
  final IconData buttonIcon;
  final Curve curve;
  final bool opacity;

  CircleFloatingButton(
      {Key key,
      this.items,
      this.radius = 100,
      this.position = Position.right,
      this.right,
      this.top,
      this.completeCircle = false,
      this.duration = const Duration(milliseconds: 300),
      this.type,
      this.buttonColor,
      this.buttonIcon,
      this.curve,
      this.opacity})
      : super(key: key ?? UniqueKey());

  factory CircleFloatingButton.floatingActionButton(
      {List<Widget> items,
      double radius = 100,
      Duration duration,
      IconData icon,
      Color color,
      Curve curveAnim,
      bool useOpacity}) {
    return CircleFloatingButton(
      items: items,
      radius: radius,
      position: Position.bottom,
      type: CircleType.quarterPart,
      duration: duration,
      buttonIcon: icon,
      buttonColor: color,
      curve: curveAnim,
      opacity: useOpacity,
    );
  }

  factory CircleFloatingButton.completeCircle(
      {@required List<Widget> items,
      double radius = 100,
      Duration duration,
      IconData icon,
      Color color,
      Curve curveAnim,
      bool useOpacity}) {
    return CircleFloatingButton(
      items: items,
      radius: radius,
      position: Position.bottom,
      type: CircleType.complete,
      duration: duration,
      buttonIcon: icon,
      buttonColor: color,
      curve: curveAnim,
      opacity: useOpacity,
    );
  }

  factory CircleFloatingButton.semiCircle(
      {List<Widget> items,
      double radius = 100,
      Position position,
      Duration duration,
      IconData icon,
      Color color,
      Curve curveAnim,
      bool useOpacity}) {
    return CircleFloatingButton(
      items: items,
      radius: radius,
      position: position,
      type: CircleType.semi,
      duration: duration,
      buttonIcon: icon,
      buttonColor: color,
      curve: curveAnim,
      opacity: useOpacity,
    );
  }

  @override
  _CircleFloatingButtonState createState() => _CircleFloatingButtonState();
}

class _CircleFloatingButtonState extends State<CircleFloatingButton> {
  BlocController bloc;
  GlobalKey containerKey = GlobalKey();

  @override
  initState() {
    super.initState();
    bloc = BlocController();
  }

  Offset _getOffset(double angle, double radius) {
    final double radians = math.pi * angle / 180.0;
    final double x = radius * math.cos(radians) * -1;
    final double y = radius * math.sin(radians) * -1;
    return Offset(x, y);
  }

  getRotatePosition(Position postion) {
    switch (postion) {
      case Position.right:
        return 90;
      case Position.bottom:
        return 180;
      case Position.left:
        return 270;
      case Position.top:
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case CircleType.semi:
        return semi();
        break;
      case CircleType.complete:
        return complete();
        break;
      case CircleType.quarterPart:
        return quarterPart();
    }

    return Container();
  }

  Widget quarterPart() {
    var quantity = widget.items.length;
    return Container(
      width: widget.radius * 1.6,
      height: widget.radius * 1.6,
      child: Stack(
        overflow: Overflow.visible,
        children: List.generate(
          quantity,
          (index) {
            var angulo = (90) / (quantity - 1) * (index);

            return CircleButton(
              finalRight: _getOffset(
                          angulo + getRotatePosition(widget.position),
                          -widget.radius)
                      .dy +
                  widget.radius,
              finalTop: _getOffset(angulo + getRotatePosition(widget.position),
                          -widget.radius)
                      .dx +
                  widget.radius,
              initState: widget.radius,
              bloc: bloc,
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
              child: FloatingActionButton(
                backgroundColor: widget.buttonColor,
                onPressed: () {
                  bloc.toggle();
                },
                child: Icon(widget.buttonIcon ?? Icons.add),
              ),
            ),
          ),
      ),
    );
  }

  Widget complete() {
    var quantity = widget.items.length;
    return Container(
      child: Stack(
        overflow: Overflow.visible,
        children: List.generate(
          quantity,
          (index) {
            var angulo = (360) / (quantity) * (index);

            return CircleButton(
                finalRight: _getOffset(
                            angulo + getRotatePosition(widget.position),
                            -widget.radius)
                        .dy +
                    widget.radius,
                finalTop: _getOffset(
                            angulo + getRotatePosition(widget.position),
                            -widget.radius)
                        .dx +
                    widget.radius,
                initState: widget.radius,
                bloc: bloc,
                duration: widget.duration,
                curve: widget.curve,
                opacity: widget.opacity,
                widget: widget.items[index]);
          },
        )..add(
            Positioned(
              top: widget.radius,
              left: widget.radius,
              child: FloatingActionButton(
                backgroundColor: widget.buttonColor,
                onPressed: () {
                  bloc.toggle();
                },
                child: Icon(widget.buttonIcon ?? Icons.add),
              ),
            ),
          ),
      ),
    );
  }

  Widget semi() {
    var quantity = widget.items.length;

    return Container(
      child: Stack(
        overflow: Overflow.visible,
        children: List.generate(
          quantity,
          (index) {
            var angulo = (180) / (quantity - 1) * (index);

            return CircleButton(
              finalRight: _getOffset(
                          angulo + getRotatePosition(widget.position),
                          -widget.radius)
                      .dy +
                  widget.radius,
              finalTop: _getOffset(angulo + getRotatePosition(widget.position),
                          -widget.radius)
                      .dx +
                  widget.radius,
              initState: widget.radius,
              bloc: bloc,
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
              child: FloatingActionButton(
                backgroundColor: widget.buttonColor,
                onPressed: () {
                  bloc.toggle();
                },
                child: Icon(widget.buttonIcon ?? Icons.add),
              ),
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
