import 'package:flutter/material.dart';
import 'package:radial_button/widget/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Widget> itemsActionBar;
  late List<Widget> itemsToBody;
  late List<Widget> itemsToBodyComplete;

  GlobalKey<CircleFloatingButtonState> key01 =
      GlobalKey<CircleFloatingButtonState>();
  GlobalKey<CircleFloatingButtonState> key02 =
      GlobalKey<CircleFloatingButtonState>();
  GlobalKey<CircleFloatingButtonState> key03 =
      GlobalKey<CircleFloatingButtonState>();

  void close() {
    key01.currentState!.close();
  }

  @override
  void initState() {
    itemsActionBar = [
      FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: Colors.greenAccent,
        onPressed: close,
        child: const Icon(Icons.add),
      ),
      FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: Colors.indigoAccent,
        onPressed: close,
        child: const Icon(Icons.camera),
      ),
      FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: Colors.orangeAccent,
        onPressed: close,
        child: const Icon(Icons.card_giftcard),
      ),
    ];

    itemsToBody = [
      FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: Colors.greenAccent,
        onPressed: () {
          key02.currentState?.close();
        },
        child: const Icon(Icons.add),
      ),
      FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: Colors.indigoAccent,
        onPressed: () {
          key02.currentState?.close();
        },
        child: const Icon(Icons.camera),
      ),
      FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: Colors.orangeAccent,
        onPressed: () {
          key02.currentState?.close();
        },
        child: const Icon(Icons.card_giftcard),
      ),
      FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: Colors.indigoAccent,
        onPressed: () {
          key02.currentState?.close();
        },
        child: const Icon(Icons.accessibility_new),
      ),
      FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: Colors.white70,
        onPressed: () {
          key02.currentState?.close();
        },
        child: const Icon(Icons.camera),
      ),
      FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: Colors.black,
        onPressed: () {
          key02.currentState?.close();
        },
        child: const Icon(Icons.camera),
      ),
    ];

    itemsToBodyComplete = [
      FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: Colors.redAccent,
        onPressed: () {
          key03.currentState?.close();
        },
        child: const Icon(Icons.add),
      ),
      FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: Colors.indigoAccent,
        onPressed: () {
          key03.currentState?.close();
        },
        child: const Icon(Icons.camera),
      ),
      FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          key03.currentState?.close();
        },
        child: const Icon(Icons.card_giftcard),
      ),
      FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: Colors.indigoAccent,
        onPressed: () {
          key03.currentState?.close();
        },
        child: const Icon(Icons.accessibility_new),
      ),
      FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: Colors.cyanAccent,
        onPressed: () {
          key03.currentState?.close();
        },
        child: const Icon(Icons.camera),
      ),
      FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: Colors.brown,
        onPressed: () {
          key03.currentState?.close();
        },
        child: const Icon(Icons.camera),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          CircleFloatingButton.semiCircle(
            key: key02,
            position: Position.right,
            useOpacity: true,
            items: itemsToBody,
            color: Colors.red,
            icon: Icons.adb,
            duration: const Duration(milliseconds: 1000),
            curveAnim: Curves.elasticOut,
          ),
          Positioned(
            bottom: 100,
            right: 10,
            child: SizedBox(
              height: 300,
              width: 300,
              child: CircleFloatingButton.completeCircle(
                key: key03,
                useOpacity: true,
                items: itemsToBodyComplete,
                color: Colors.blue,
                icon: Icons.adb,
                duration: const Duration(milliseconds: 1000),
                curveAnim: Curves.elasticOut,
                child: Container(
                  color: Colors.red,
                  child: const CircleAvatar(
                    maxRadius: 30,
                    child: Text('Casa'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: CircleFloatingButton.floatingActionButton(
        useOpacity: true,
        key: key01,
        items: itemsActionBar,
        color: Colors.redAccent,
        icon: Icons.ac_unit,
        duration: const Duration(milliseconds: 1000),
        curveAnim: Curves.ease,
      ),
    );
  }
}
