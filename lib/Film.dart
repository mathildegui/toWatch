class Film {
  final int id;
  final String posterPath;
  final bool adult;
  final String overview;
  final String releaseDate;
  final List<int> genreIds;
  final String originalTitle;
  final String original_language;
  final String title;
  final String backdrop_path;
//  final double popularity;
  final int vote_count;
  final bool video;
//  final double vote_average;

  Film(this.id,
      this.posterPath,
      this.adult,
      this.overview,
      this.releaseDate,
      this.genreIds,
      this.originalTitle,
      this.original_language,
      this.title,
      this.backdrop_path,
      this.vote_count,
      this.video);

  Film.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        posterPath = json['poster_path'],
        adult = json['adult'],
        overview = json['overview'],
        releaseDate = json['release_date'],
        genreIds = new List<int>.from(json['genre_ids']),
        originalTitle = json['original_title'],
        original_language = json['original_language'],
        title = json['title'],
        backdrop_path = json['backdrop_path'],
//        popularity = json['popularity'],
        vote_count = json['vote_count'],
        video = json['video'];
//        vote_average = json['vote_average'].toDouble();

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'poster_path': posterPath,
        'adult': adult,
        'overview': overview,
        'release_date': releaseDate,
        'genre_ids': genreIds,
        'original_title': originalTitle,
        'original_language': original_language,
        'title': title,
        'backdrop_path': backdrop_path,
//        'popularity': popularity,
        'vote_count': vote_count,
        'video': video,
//        'vote_average': vote_average,
      };

}