
import 'package:flutter/material.dart';
import 'package:movies/views/movie/movie_detail.dart';
import 'package:movies/services/tmdb.dart';

class TopRatedMovieList extends StatefulWidget {
  @override
  TopRatedMovieListState createState() {
    return new TopRatedMovieListState();
  }
}

class TopRatedMovieListState extends State<TopRatedMovieList> {
  var movies;
  Color mainColor = Colors.black;

  void getData() async {
    var data = await getTopRated();

    setState(() {
      movies = data['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();

    return Container(
      
      child:  Padding(
        padding: const EdgeInsets.all(16.0),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
             ListTitle(Colors.black),
             Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies == null ? 0 : movies.length,
                    itemBuilder: (context, i) {
                      return FlatButton(
                        child: MovieCell(movies, i),
                        padding: const EdgeInsets.all(0.0),
                        onPressed: () {
                          Navigator.push(context,
                               MaterialPageRoute(builder: (context) {
                                return MovieDetail(movies[i]);
                          }));
                        },
                        color: Colors.transparent,
                      );
                    }
                  )
              )
            
          ],

        ),
      ),
    );
  }
}

class ListTitle extends StatelessWidget {
  final Color mainColor;

  ListTitle(this.mainColor);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      child: new Text(
        'Top Rated',
        style: new TextStyle(
            fontSize: 40.0,
            color: mainColor,
            fontWeight: FontWeight.bold,
            fontFamily: 'Arvo'),
        textAlign: TextAlign.left,
      ),
    );
  }
}

class MovieCell extends StatelessWidget {
  final movies;
  final i;
  Color mainColor = Colors.black;
  var image_url = 'https://image.tmdb.org/t/p/w500/';
  MovieCell(this.movies, this.i);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(0.0),
              child: new Container(
                margin: const EdgeInsets.all(16.0),
                child: new Container(
                  width: 70.0,
                  height: 100.0,
                ),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(1.0),
                  color: Colors.grey,
                  image: new DecorationImage(
                      image: new NetworkImage(
                          image_url + movies[i]['poster_path']),
                      fit: BoxFit.cover
                  ),
                  boxShadow: [
                    new BoxShadow(
                        color: mainColor,
                        blurRadius: 5.0,
                        offset: new Offset(2.0, 5.0))
                  ],
                ),
              ),
            ),  
            SizedBox(
              width: 100,
              child: Center(
                child:Text(
                movies[i]['title'],
                textAlign: TextAlign.center,
                style: new TextStyle(
                    color: Colors.black, fontFamily: 'Arvo',fontSize: 18),
                ),
              )
            )
             
      ],
    );
  }
}