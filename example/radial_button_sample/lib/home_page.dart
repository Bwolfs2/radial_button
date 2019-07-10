import 'package:flutter/material.dart';
import 'package:radial_button/widget/circle_floating_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var itemsActionBar = [
    FloatingActionButton(
      backgroundColor: Colors.greenAccent,
      onPressed: () {},
      child: Icon(Icons.add),
    ),
    FloatingActionButton(
      backgroundColor: Colors.indigoAccent,
      onPressed: () {},
      child: Icon(Icons.camera),
    ),
    FloatingActionButton(
      backgroundColor: Colors.orangeAccent,
      onPressed: () {},
      child: Icon(Icons.card_giftcard),
    ),
  ];

  var itemsToBody = [
    FloatingActionButton(
      backgroundColor: Colors.greenAccent,
      onPressed: () {},
      child: Icon(Icons.add),
    ),
    FloatingActionButton(
      backgroundColor: Colors.indigoAccent,
      onPressed: () {},
      child: Icon(Icons.camera),
    ),
    FloatingActionButton(
      backgroundColor: Colors.orangeAccent,
      onPressed: () {},
      child: Icon(Icons.card_giftcard),
    ),
    FloatingActionButton(
      backgroundColor: Colors.indigoAccent,
      onPressed: () {},
      child: Icon(Icons.accessibility_new),
    ),
    FloatingActionButton(
      backgroundColor: Colors.white70,
      onPressed: () {},
      child: Icon(Icons.camera),
    ),
    FloatingActionButton(
      backgroundColor: Colors.black,
      onPressed: () {},
      child: Icon(Icons.camera),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CircleFloatingButton.semiCircle(
          items: itemsToBody,
          color: Colors.red,
          icon: Icons.adb,
          duration: Duration(milliseconds: 1000),
          curveAnim: Curves.elasticOut,
        ),
      ),
      floatingActionButton: CircleFloatingButton.floatingActionButton(
        items: itemsActionBar,
        color: Colors.redAccent,
        icon: Icons.ac_unit,
        duration: Duration(milliseconds: 1000),
        curveAnim: Curves.ease,
      ),
    );
  }
}
