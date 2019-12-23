

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

const apiKey = "0ba207770180312f194f997f6921ca29";
const baseUrl = "https://api.themoviedb.org/3";



Future<Map> getTopRated() async {
  var url = '$baseUrl/movie/top_rated?api_key=$apiKey';
  var response = await http.get(url);
  return json.decode(response.body);
}

Future<Map> getUpcoming() async {
  var url = '$baseUrl/movie/upcoming?api_key=$apiKey';
  var response = await http.get(url);
  return json.decode(response.body);
}

Future<Map> getNowPlaying() async {
  var url = '$baseUrl/movie/now_playing?api_key=$apiKey';
  var response = await http.get(url);
  return json.decode(response.body);
}

Future<Map> getSearchResult(String query) async {
  var url ='$baseUrl/search/movie?api_key=$apiKey&query=$query&page=1';
  var response = await http.get(url);
  return json.decode(response.body);
}