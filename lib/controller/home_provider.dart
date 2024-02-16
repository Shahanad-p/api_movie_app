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
// class HomeProvider extends ChangeNotifier {
//   final ApiService movieApiService = ApiService();
//   List<Movies> movies = [];
//   dynamic _error;

//   dynamic get error => _error;

//   Future<void> fetchDatas({required String url, required BuildContext context}) async {
//     try {
//       List<Movies> movieResults =
//           await movieApiService.getAllMovies(apiUrl: url, context: context);
//       movies = movieResults;
//       notifyListeners();
//     } catch (error) {
//       _error = error;
//       notifyListeners();
//     }
//   }
// }
// class HomeProvider extends ChangeNotifier {
//   final ApiService movieApiService = ApiService();
//   List<Movies> movies = [];
//   dynamic _error;
//   AsyncSnapshot<List<Movies>>? _snapshot;

//   dynamic get error => _error;
//   AsyncSnapshot<List<Movies>>? get snapshot => _snapshot;

//   Future<void> fetchDatas({required String url, required BuildContext context}) async {
//     try {
//       List<Movies> movieResults =
//           await movieApiService.getAllMovies(apiUrl: url, context: context);
//       movies = movieResults;
//       _snapshot = AsyncSnapshot.withData(ConnectionState.done, movies);
//       notifyListeners();
//     } catch (error) {
//       _error = error;
//       _snapshot = AsyncSnapshot.withError(ConnectionState.done, error);
//       notifyListeners();
//     }
//   }
// }
