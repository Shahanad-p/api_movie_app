import 'package:flutter/material.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/service/api_service.dart';

class HomeProvider extends ChangeNotifier {
  final ApiService movieApiService = ApiService();
  List<Movies> movies = [];
  Future fetchDatas({required url, required BuildContext context}) async {
    try {
      List<Movies> movieResults =
          await movieApiService.getAllMovies(apiUrl: url, context: context);
      movies = movieResults;
      notifyListeners();
      return movies;
    } catch (error) {
      Exception(error);
      notifyListeners();
    }
    notifyListeners();
  }
}
