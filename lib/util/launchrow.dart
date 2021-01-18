import 'package:flutter/material.dart';
import 'package:spacex_obligatorisk/model/Launch.dart';
import 'fetchtool.dart';
import 'package:spacex_obligatorisk/model/Rocket.dart';
import 'package:spacex_obligatorisk/util/launchdetails.dart';
import 'dart:convert';

class LaunchRow extends StatelessWidget {
  final Launch launch;
  LaunchRow(this.launch);

  @override
  Widget build(BuildContext context) {
    final launchThumbnail = new Container(
      margin: new EdgeInsets.symmetric(vertical: 16.0),
      alignment: FractionalOffset.centerLeft,
      child: Image.network(
        launch.links.missionPatchSmall,
        height: 100.0,
        width: 92.0,
      ),
    );
    
    final launchCardContent = new Container(
        margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
        constraints: new BoxConstraints.expand(),
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(height: 4.0),
              new Text(
                launch.missionName,
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0),
              ),
              new Container(height: 10.0),
              new Row(children: <Widget>[
                new Container(width: 8.0),
                new Text(
                  launch.rocket.rocketName,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ]),
              new Container(height: 10,),
              new Row(children: [
                 new Container(width: 10),
                new Text(
                  "Success: ",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                new Image.asset(launch.getSuccessIcon(launch.launchSuccess),
                    height: 12.0),
                    
              ],)
            ]));

    final launchCard = new Container(
      height: 135.0,
      margin: new EdgeInsets.only(left: 46.0),
      decoration: new BoxDecoration(
        color: Colors.indigo,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
      child: launchCardContent,
    );

    return new Container(
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: GestureDetector(
          onTap: () {
            List<Rockets> rockets = new List<Rockets>();
            Fetch.getRockets().then((response) {
              Iterable list = json.decode(response.body);
              rockets = list.map((model) => Rockets.fromJson(model)).toList();
              for (var i = 0; i < rockets.length; i++) {
                if (rockets[i].id.compareTo(launch.rocket.rocketId) == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LaunchDetailsPage(
                            launch: launch, rocket: rockets[i])),
                  );
                }
              }
            });
          },
          child: new Stack(
            children: <Widget>[
              launchCard,
              launchThumbnail,
            ],
          ),
        ));
  }
}
