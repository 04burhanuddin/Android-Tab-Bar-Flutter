import 'package:flutter/material.dart';

import './page_computer.dart' as computer;
import './page_headset.dart' as headset;
import './page_radio.dart' as radio;
import './page_smartphone.dart' as smartphone;

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Tab Bar",
    home: new HomeApp(),
  ));
}

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> with SingleTickerProviderStateMixin {
  TabController controller;
  // init state
  @override
  void initState() {
    controller = new TabController(length: 4, vsync: this);
    super.initState();
  }

  // dispose
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blue,
        title: new Text(
          "Home Aplication",
          style: new TextStyle(fontSize: 25.0),
        ),
        bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.computer),
              text: "Computer",
            ),
            new Tab(
              icon: new Icon(Icons.headset),
              text: "Headset",
            ),
            new Tab(
              icon: new Icon(Icons.radio),
              text: "Radio",
            ),
            new Tab(
              icon: new Icon(Icons.smartphone),
              text: "Smartphone",
            ),
          ],
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new computer.Computer(),
          new headset.Headset(),
          new radio.Radio(),
          new smartphone.Smartphone(),
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.blue,
        child: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.computer),
            ),
            new Tab(
              icon: new Icon(Icons.headset),
            ),
            new Tab(
              icon: new Icon(Icons.radio),
            ),
            new Tab(
              icon: new Icon(Icons.smartphone),
            ),
          ],
        ),
      ),
    );
  }
}
