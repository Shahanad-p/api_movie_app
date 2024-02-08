class TrendingMovies {
  String title;
  String backDropPath;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  String voteAverage;

  TrendingMovies({
    required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });
  factory TrendingMovies.fromJson(Map<String, dynamic> json) {
    return TrendingMovies(
      title: json['title'] ?? 'cant fetch title name',
      backDropPath: json['backdrop_path'] ?? 'cant fetch the image',
      originalTitle: json['original_title'] ?? 'cant fetch title',
      overview: json['overview'] ?? 'cant fetch overview description',
      posterPath: json['poster_path'] ?? 'cant fetch the image',
      releaseDate: json['release_date'] ?? 'cant fetch release date',
      voteAverage: json['vote_average'] ?? 'cant fetch people voting',
    );
  }
}
