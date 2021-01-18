import 'package:flutter/material.dart';
import 'package:spacex_obligatorisk/model/Launch.dart';
import 'package:spacex_obligatorisk/model/Rocket.dart';

class LaunchDetailsPage extends StatelessWidget {
  const LaunchDetailsPage({
    Key key,
    this.index,
    this.launch,
    this.rocket,
  }) : super(key: key);

  final int index;
  final Launch launch;
  final Rockets rocket;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: SafeArea(
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/img/detailbg.png"),
                        fit: BoxFit.cover)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                      ),
                      Text(launch.missionName,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                      Container(
                          child: Container(
                        width: double.infinity,
                        height: 250,
                        margin: new EdgeInsets.all(10.0),
                        child: Center(
                          child: Container(
                            height: 250,
                            alignment: Alignment(0.0, 10),
                            child: Image(
                              image:
                                  NetworkImage(launch.links.missionPatchSmall),
                              width: 300,
                              height: 300,
                            ),
                          ),
                        ),
                      )),
                      Text(
                        rocket.name,
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment(0.0, 2.5),
                        child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(rocket.flickrImages.first),
                          radius: 100.0,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Launch Time",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      
                      Text(launch.getLaunchDate(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Launch Description",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                      Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Stack(
                            children: [
                              new RichText(
                                  text: TextSpan(
                                text: launch.details,
                                style: TextStyle(
                                  fontSize: 20,
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.w300,
                                  foreground: Paint()
                                ),
                              )),
                              new RichText(
                                  text: TextSpan(
                                    text: launch.details,
                                    style: TextStyle(
                                      fontSize: 20,
                                      letterSpacing: 2.0,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white),
                              )),
                            ],
                          )),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ))));
  }
}
