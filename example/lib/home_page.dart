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
      appBar: AppBar(
        title: Text("Sample"),
        centerTitle: true,
      ),
      body: Container(       
        child: Stack(
          children: <Widget>[
            Container( 
              child: CircleFloatingButton.semiCircle(
                items: itemsToBody,
                color: Colors.red,
                icon: Icons.adb,
                duration: Duration(milliseconds: 1000),
                curveAnim: Curves.elasticOut,
              ),
            ),
            Positioned(
              bottom: 100,
              right: 10,
              child: Container(                
                height: 300,
                width: 300,
                child: CircleFloatingButton.completeCircle(
                  items: itemsToBody,
                  color: Colors.blue,
                  icon: Icons.adb,
                  duration: Duration(milliseconds: 1000),
                  curveAnim: Curves.elasticOut,
                ),
              ),
            ),
          ],
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
