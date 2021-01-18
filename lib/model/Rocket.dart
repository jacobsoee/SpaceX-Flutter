class Rockets {
  int rocketid;
  String id;
  String name;
  List<String> flickrImages;
  String description;

  Rockets(int rocketid, String id, String name, List<String> flickrImages,
      String wikipedia, String description) {
    this.rocketid = rocketid;
    this.id = id;
    this.name = name;
    this.flickrImages = flickrImages;
    this.description = description;
  }

  Rockets.fromJson(Map json)
      : rocketid = json['rocketid'],
        id = json['id'],
        name = json['name'],
        flickrImages = json['flickr_images'].cast<String>(),
        description = json['description'];

  Map toJson() {
    return {
      'rocketid': rocketid,
      'id': id,
      'name': name,
      'flickr_images': flickrImages,
      'description': description
    };
  }
}
