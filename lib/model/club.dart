import 'package:football/model/location.dart';
import 'package:football/model/stadium.dart';

class Club {
  String id;
  String name;
  String country;
  int value;
  String image;
  bool hasImage;
  int europeanTitles;
  Stadium stadium;
  Location location;

  Club(
      {this.id,
      this.name,
      this.country,
      this.value,
      this.image,
      this.hasImage,
      this.europeanTitles,
      this.stadium,
      this.location});

  Club.fromJson(Map<String, dynamic> json) {
    if (json['name'] == null ||
        json['country'] == null ||
        json['value'] == null ||
        json['european_titles'] == null) {
      throw new Exception(["DATA_CORRUPTED"]);
    }

    id = json['id'];
    name = json['name'];
    country = json['country'];
    value = int.parse(json['value'].toString());
    image = json['image'];
    hasImage = json['image'] != null;
    europeanTitles = int.parse(json['european_titles'].toString());
    stadium = Stadium.fromJson(json['stadium']);
    location = Location.fromJson(json['location']);
  }

  @override
  String toString() {
    return 'Club{id: $id, name: $name, country: $country, value: $value, image: $image, hasImage: $hasImage, europeanTitles: $europeanTitles, stadium: $stadium, location: $location}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Club && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
}
