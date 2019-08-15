import 'package:flutter/material.dart';
import 'package:radial_button/widget/circle_floating_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> itemsActionBar;
  List<Widget> itemsToBody;
  List<Widget> itemsToBodyComplete;

  GlobalKey<CircleFloatingButtonState> key01 =
      GlobalKey<CircleFloatingButtonState>();
  GlobalKey<CircleFloatingButtonState> key02 =
      GlobalKey<CircleFloatingButtonState>();
  GlobalKey<CircleFloatingButtonState> key03 =
      GlobalKey<CircleFloatingButtonState>();

  fechar() {
    key01.currentState.close();
  }

  @override
  void initState() {
    itemsActionBar = [
      FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: Colors.greenAccent,
        onPressed: fechar,
        child: Icon(Icons.add),
      ),
      FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: Colors.indigoAccent,
        onPressed: fechar,
        child: Icon(Icons.camera),
      ),
      FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: Colors.orangeAccent,
        onPressed: fechar,
        child: Icon(Icons.card_giftcard),
      ),
    ];

    itemsToBody = [
      FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: Colors.greenAccent,
        onPressed: () {
          key02.currentState.close();
        },
        child: Icon(Icons.add),
      ),
      FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: Colors.indigoAccent,
        onPressed: () {
          key02.currentState.close();
        },
        child: Icon(Icons.camera),
      ),
      FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: Colors.orangeAccent,
        onPressed: () {
          key02.currentState.close();
        },
        child: Icon(Icons.card_giftcard),
      ),
      FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: Colors.indigoAccent,
        onPressed: () {
          key02.currentState.close();
        },
        child: Icon(Icons.accessibility_new),
      ),
      FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: Colors.white70,
        onPressed: () {
          key02.currentState.close();
        },
        child: Icon(Icons.camera),
      ),
      FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: Colors.black,
        onPressed: () {
          key02.currentState.close();
        },
        child: Icon(Icons.camera),
      ),
    ];

    itemsToBodyComplete = [
      FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: Colors.redAccent,
        onPressed: () {
          key03.currentState.close();
        },
        child: Icon(Icons.add),
      ),
      FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: Colors.indigoAccent,
        onPressed: () {
          key03.currentState.close();
        },
        child: Icon(Icons.camera),
      ),
      FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          key03.currentState.close();
        },
        child: Icon(Icons.card_giftcard),
      ),
      FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: Colors.indigoAccent,
        onPressed: () {
          key03.currentState.close();
        },
        child: Icon(Icons.accessibility_new),
      ),
      FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: Colors.cyanAccent,
        onPressed: () {
          key03.currentState.close();
        },
        child: Icon(Icons.camera),
      ),
      FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: Colors.brown,
        onPressed: () {
          key03.currentState.close();
        },
        child: Icon(Icons.camera),
      ),
    ];
    super.initState();
  }

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
                key: key02,
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
                  key: key03,
                  items: itemsToBodyComplete,
                  color: Colors.blue,
                  icon: Icons.adb,
                  duration: Duration(milliseconds: 1000),
                  curveAnim: Curves.elasticOut,
                  child: Container(
                    color: Colors.red,
                    child: CircleAvatar(
                      child: Text("Casa"),
                      maxRadius: 30,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: CircleFloatingButton.floatingActionButton(
        key: key01,
        items: itemsActionBar,
        color: Colors.redAccent,
        icon: Icons.ac_unit,
        duration: Duration(milliseconds: 1000),
        curveAnim: Curves.ease,
      ),
    );
  }
}
