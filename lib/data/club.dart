
import 'package:football/data/location.dart';
import 'package:football/data/stadium.dart';

class Club {
  String id;
  String name;
  String country;
  int value;
  String image;
  int europeanTitles;
  Stadium stadium;
  Location location;

  Club(
      {this.id,
      this.name,
      this.country,
      this.value,
      this.image,
      this.europeanTitles,
      this.stadium,
      this.location});

  @override
  String toString() {
    return 'Club{id: $id, name: $name, country: $country, value: $value, image: $image, europeanTitles: $europeanTitles, stadium: $stadium, location: $location}';
  }

  Club.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country'];
    value = json['value'];
    image = json['image'];
    europeanTitles = json['european_titles'];
    stadium = Stadium.fromJson(json['stadium']);
    location = Location.fromJson(json['location']);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Club && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
}
