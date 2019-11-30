import 'package:flutter/material.dart';
import 'package:movies/ui/background.dart';
import 'package:movies/views/movie/my_movie_list.dart';
import 'package:movies/views/movie/now_playing_movie_list.dart';
import 'package:movies/views/movie/top_rated_movie_list.dart';
import 'package:movies/views/movie/upcoming_movie_list.dart';
import 'package:movies/services/auth.dart';
class HomePage extends StatefulWidget {
 @override
 State<StatefulWidget> createState() {
    return _HomePageState();
  }
}
class _HomePageState extends State<HomePage> {
  
  final AuthService _auth = AuthService();

  int _currentIndex = 0;
  final List<Widget> _children = [
    NowPlayingMovieList(),
    TopRatedMovieList(),
    UpComingMovieList(),
    MyMovieList()
  ];

  void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }
 @override
 Widget build(BuildContext context) {
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
           icon: Icon(Icons.supervised_user_circle,color: Colors.indigo,),
          title: Text('My Movie',style: TextStyle(color: Colors.indigo)),
        )
      ],
    ),
   );
 }
}