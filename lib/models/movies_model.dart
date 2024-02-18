class Movies {
  String? title;
  String? backDropPath;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  double? voteAverage;
  int? id;
  String? name;

  Movies({
    required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.id,
    required this.name,
  });
  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
      title: json['title'] ?? 'No title',
      backDropPath: json['backdrop_path'] ?? 'assets/2134883.jpg',
      originalTitle: json['original_title'] ?? 'No title',
      overview: json['overview'] ?? 'No overview',
      posterPath: json['poster_path'] ?? 'assets/2134883.jpg',
      releaseDate: json['release_date'] ?? 'No date',
      voteAverage: json['vote_average'].toDouble() ?? 'No voting',
      id: json['id'] ?? 'No data',
      name: json['name'] ?? 'No name',
    );
  }
}
