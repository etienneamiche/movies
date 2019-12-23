import 'package:flutter/material.dart';
import 'package:movies/services/tmdb.dart';
import 'package:movies/views/movie/movie_list.dart';


class SearchMovie extends StatefulWidget {
  
  @override
  SearchMovieState createState(){
    return SearchMovieState();
  }
}

class SearchMovieState extends State<SearchMovie> {
  final TextEditingController _filter = new TextEditingController();
 
  var _result = [];

  void _getResult(String value) async {
    final response = await getSearchResult(value);
    setState(() {
      _result = response["results"];
      print(_result);
    });
  }
   Widget _searchBar(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.all(16.0),
      child: TextField(
          onSubmitted: (String value)  {_getResult(_filter.text);},
          controller: _filter,
          decoration: InputDecoration(
                        labelText: "Search ...",
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.search),
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        )
                    ),
        ));
  }
  
  
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {

    return Column(
      
      children: <Widget>[
        _searchBar(context),
        Expanded(
          child:MovieList(movies:_result,name: "")
        )
      ]
    );
  } 
}