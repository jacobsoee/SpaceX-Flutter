import 'package:intl/intl.dart';

class Launch {
  int flightNumber;
  String missionName;
  Links links;
  Rocket rocket;
  String launchDateUtc;
  String details;
  bool launchSuccess;

  Launch(
    {this.flightNumber, 
    this.missionName,
    this.rocket,
    this.links,
    this.launchSuccess});

    Launch.fromJson(Map<String, dynamic> json) {
        this.flightNumber = json["flight_number"];
        this.missionName = json["mission_name"];
        this.links = json["links"] != null ? Links.fromJson(json["links"]) : null;
        this.rocket = json["rocket"] != null ? Rocket.fromJson(json["rocket"]) : null;
        this.launchDateUtc = json["launch_date_utc"];
        this.details = json["details"];
        this.launchSuccess = json["launch_success"] != null ? json["launch_success"] : false;
    }

    String getLaunchDate() {
    String processedTime = "";
    DateTime date = DateTime.parse(this.launchDateUtc);
    processedTime = DateFormat('kk:mm dd-MM-yyyy').format(date);
    return processedTime;
  }

    String getSuccessIcon(bool input) {
    if (input) {
      return "assets/img/check.png";
    } else {
      return "assets/img/close.png";
    }
  }
}

class Links {
  String missionPatch;
  String missionPatchSmall;

  Links({this.missionPatch, this.missionPatchSmall});

  Links.fromJson(Map<String, dynamic> json) {
    missionPatch = json['mission_patch'];
    missionPatchSmall = json['mission_patch_small'];
  }
}

class Rocket {
  String rocketId;
  String rocketName;
  String rocketType;

  Rocket({this.rocketId, this.rocketName, this.rocketType});

  Rocket.fromJson(Map<String, dynamic> json) {
    rocketId = json['rocket_id'];
    rocketName = json['rocket_name'];
    rocketType = json['rocket_type'];
  }
}
