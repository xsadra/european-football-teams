class Stadium {
  String name;
  BigInt size;

  Stadium({this.name, this.size});

  Stadium.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    size = BigInt.from(json['size']);
  }

  @override
  String toString() {
    return 'Stadium{name: $name, size: $size}';
  }
}
