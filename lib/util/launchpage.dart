import 'dart:convert';
import 'package:spacex_obligatorisk/util/gradientappbar.dart';
import 'package:spacex_obligatorisk/util/launchpagebody.dart';
import 'package:spacex_obligatorisk/model/Launch.dart';
import 'package:spacex_obligatorisk/util/fetchtool.dart';
import 'package:flutter/material.dart';

class LaunchPage extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      title: 'SpaceX Launches',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyListScreen(),
    );
  }
}

class MyListScreen extends StatefulWidget {
  @override
  createState() => _MyListScreenState();
}

class _MyListScreenState extends State {
  List<Launch> launches;
  List<Widget> widgets = new List<Widget>();

  getLaunches() {
    Fetch.getLaunches().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        widgets.add(GradientAppBar("Launches"));
        launches = list.map((model) => Launch.fromJson(model)).toList();
        for (var i = 0; i < launches.length; i++) {
          widgets.add(new LaunchPageBody(launch: launches[i]));
        }
      });
    });
  }

  initState() {
    super.initState();
    getLaunches();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
          color: Colors.black,
          child: SingleChildScrollView(
              child: new Column(
            children: widgets,
          ))),
      resizeToAvoidBottomPadding: false,
    );
  }
}
