

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

const apiKey = "0ba207770180312f194f997f6921ca29";

// get top rated movies 

Future<Map> getTopRated() async {
  var url = 'http://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey';
  var response = await http.get(url);
  return json.decode(response.body);
}

Future<Map> getUpcomming() async {
  var url = 'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey';
  var response = await http.get(url);
  return json.decode(response.body);
}

Future<Map> getNowPlaying() async {
  var url = 'https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey';
  var response = await http.get(url);
  return json.decode(response.body);
}