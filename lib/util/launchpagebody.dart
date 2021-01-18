import 'package:flutter/material.dart';
import 'launchrow.dart';
import 'package:spacex_obligatorisk/model/Launch.dart';

class LaunchPageBody extends StatelessWidget {
  const LaunchPageBody({
    Key key,
    this.index,
    this.launch,
  }) : super(key: key);

  final int index;
  final Launch launch;
  @override
  Widget build(BuildContext context) {
    return LaunchRow(launch);
  }
}
