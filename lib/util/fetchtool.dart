import 'package:http/http.dart' as http;

class Fetch {
  static Future getLaunches() {
    return http.get("https://api.spacexdata.com/v2/launches");
  }

  static Future getRockets() {
    return http.get("https://api.spacexdata.com/v2/rockets");
  }
}
