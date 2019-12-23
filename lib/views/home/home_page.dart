import 'package:flutter/material.dart';
import 'package:movies/services/tmdb.dart';
import 'package:movies/ui/background.dart';
import 'package:movies/views/movie/movie_list.dart';
import 'package:movies/views/movie/my_movie_list.dart';
import 'package:movies/services/auth.dart';
import 'package:movies/views/movie/search_movie.dart';


class HomePage extends StatefulWidget {
 @override State<StatefulWidget> createState() {
   
    return new _HomePageState();
  }


}
class _HomePageState extends State<HomePage> {

  
  final AuthService _auth = AuthService();
  int _currentIndex = 0;
  
  var _nowPlayingmovies;
  var _topRatedmovies;
  var _upCommingmovies;

  void _fetchData() async {
    var data1 = await getNowPlaying();
    var data2 = await getTopRated();
    var data3 = await getUpcoming();

    setState(() {
      _nowPlayingmovies = data1['results'];
      _topRatedmovies   = data2['results'];
      _upCommingmovies  = data3['results'];
    });
  }


    
 
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
   });
 }

 @override
 
 Widget build(BuildContext context) {
   
  _fetchData();
  List<Widget> _children = [
    MovieList(movies:_nowPlayingmovies, name:"Now Playing"),
    MovieList(movies:_topRatedmovies,name: "Top Rated"),
    MovieList(movies:_upCommingmovies,name:"Up Comming"),
    MyMovieList(),
    SearchMovie(),

  ];

 
  return Scaffold(
    appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.indigo,
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person,color: Colors.white,),
              label: Text('logout',style: TextStyle(color: Colors.white)),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
    body:Stack(
      children:[
        Background(),
        _children[_currentIndex], // new
      ]
    ), 
    bottomNavigationBar: BottomNavigationBar(
    backgroundColor: Colors.indigo,
    onTap: onTabTapped, // new
    currentIndex: _currentIndex, // new
    items: [
        new BottomNavigationBarItem(
          icon: Icon(Icons.alarm,color: Colors.indigo,),
          title: Text('Now Playing',style: TextStyle(color: Colors.indigo)),
        ),
        new BottomNavigationBarItem(
           icon: Icon(Icons.star,color: Colors.indigo,),
          title: Text('Top Rated',style: TextStyle(color: Colors.indigo)),
        ),
        new BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today,color: Colors.indigo,),
          title: Text('Up Comming',style: TextStyle(color: Colors.indigo)),
        ),
        new BottomNavigationBarItem(
           icon: Icon(Icons.bookmark,color: Colors.indigo,),
          title: Text('My Movie',style: TextStyle(color: Colors.indigo)),
        ),
        new BottomNavigationBarItem(
           icon: Icon(Icons.search,color: Colors.indigo,),
          title: Text('Search',style: TextStyle(color: Colors.indigo)),
        )
      ],
    ),
   );
 }
}