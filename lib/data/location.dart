class Location {
  double lat;
  double lng;

  Location({this.lat, this.lng});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  @override
  String toString() {
    return 'Location{lat: $lat, lng: $lng}';
  }
}
