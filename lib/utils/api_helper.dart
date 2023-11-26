import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/movie_model.dart';

class ApiHelper {
  static final helper = ApiHelper._();

  ApiHelper._();

  Future<List> Apicall() async {
    String apilink = "https://api.tvmaze.com/search/shows?q=all";
    var response = await http.get(Uri.parse(apilink));
    var json = jsonDecode(response.body);
    return json.map((e) => Movie.fromJson(e)).toList();
  }
}
