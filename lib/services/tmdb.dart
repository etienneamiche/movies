

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

const apiKey = "0ba207770180312f194f997f6921ca29";

// get top rated movies 

Future<Map> getTopRated() async {
  var url = 'http://api.themoviedb.org/3/discover/movie?api_key=$apiKey';
  var response = await http.get(url);
  return json.decode(response.body);
}