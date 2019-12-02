class Movie {
  
  final String title;
  final String overview;
  final String poster_path;
  String id;

  Movie({
      this.title,
      this.overview,
      this.poster_path
    });
  void setId(String id){
    this.id = id;
  }
}