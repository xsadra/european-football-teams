import 'dart:convert';

import 'package:flutter/services.dart';

class ConfigsLoader {
  static Future<String> getApiUrl() async {
    String jsonString = await _loadFromAsset();

    return jsonDecode(jsonString)['api_url'];
  }

  static Future<String> _loadFromAsset() async {
    return await rootBundle.loadString("assets/configs.json");
  }
}
