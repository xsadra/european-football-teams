import 'package:dio/dio.dart';
import 'package:football/model/club.dart';

class ClubRepository{

 static Future<List<Club>> getClubs(bool ascSort) async {
    String path = "https://public.allaboutapps.at/hiring/clubs.json";
    var dio = Dio();
    Response response = await dio.get(path);
    List<Club> list =
    (response.data as List).map((item) => Club.fromJson(item)).toList();

    if (ascSort) {
      list.sort((a, b) => a.name.compareTo(b.name));
    } else {
      list.sort((a, b) => b.name.compareTo(a.name));
    }
    print('length:');
    print(list.length);
    return list;
  }
}