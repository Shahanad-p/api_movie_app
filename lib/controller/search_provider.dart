import 'package:flutter/material.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/service/api_service.dart';

class SearchProvider extends ChangeNotifier {
  final TextEditingController queryController = TextEditingController();
  final ApiService service = ApiService();
  List<Movies> searchResults = [];
  void searchMovies(String query) async {
    if (query.isNotEmpty) {
      try {
        final searchUrl =
            "https://api.themoviedb.org/3/search/movie?query=$query&api_key=aa9a8a205c0591e06a5292b3c1835f3a";
        List<Movies> movies = await service.searchMovie(searchUrl: searchUrl);

        searchResults = movies;
        notifyListeners();
      } catch (e) {
        // print("Error: $e");
      }
    } else {
      searchResults = [];
      notifyListeners();
    }
  }
}
