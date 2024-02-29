import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  //singleton
  SharedPrefHelper._();
  static final SharedPrefHelper instance = SharedPrefHelper._();
  factory SharedPrefHelper() {
    return instance;
  }

  Future<dynamic> setUrl(String url) async {
    final prefs = await SharedPreferences.getInstance();

    debugPrint('url is $url');

    return await prefs.setString('url', url);
  }

  getUrl() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('url');
  }
}
