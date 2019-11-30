import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies/models/movie.dart';


class DatabaseServices {
  final String uid;
  DatabaseServices({this.uid});


  final CollectionReference movieCollection = Firestore.instance.collection("UsersList");
  
  
  Future createUserData() async {
    return await movieCollection.document(uid).setData({});
  }

  Future addMovieToUserList(movie) async {
    Movie m = new Movie(title: movie['title'],
                        overview: movie['overview'],
                        poster_path:movie['poster_path']);
                        print("movie added\n");
    return await movieCollection.document(uid).collection("list").add({'title':m.title,
                                                                        'overview':m.overview,
                                                                        'poster_path':m.poster_path});
  }

  List<Movie> _userListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Movie(
                    title:doc.data["title"] ?? '',
                    overview:doc.data["overview"] ?? '',
                    poster_path:doc.data["poster_path"] ?? ''
                  );
    }).toList();
  }

  Stream<List<Movie>> get list{
    return movieCollection.document(uid).collection("list")
    .snapshots().map(_userListFromSnapshot);
  }

}

