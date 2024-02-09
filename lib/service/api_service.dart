import 'package:dio/dio.dart';
import 'package:movie_app/models/movies_model.dart';

class ApiService {
  static Dio dio = Dio();
  Future<List<Movies>> getAllMovies({required apiUrl, required context}) async {
    try {
      final response = await dio.get(apiUrl);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonList = response.data;
        List<dynamic> movies = jsonList['results'];
        return movies.map((json) => Movies.fromJson(json)).toList();
      } else {
        // print('somthing is missed, so got errors');
        // throw Exception('');
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  // Future<List<CastModel>> getAllCasts(
  //     {required castUrl, required context}) async {
  //   try {
  //     final response = await dio.get(castUrl);
  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> data = response.data;
  //       if (data.containsKey('cast')) {
  //         final List<dynamic> result = data['cast'];
  //         return result.map((cast) => CastModel.fromJson(cast)).toList();
  //       } else {
  //         throw Exception('No "cast" key in response');
  //       }
  //     } else {
  //       print('${response.statusMessage}');
  //       return [];
  //     }
  //   } catch (e) {
  //     return [];
  //   }
  // }
  //////////////////////
  // Future<List<CastModel>> getCast(
  //     {required castUrl, required BuildContext context}) async {
  //   try {
  //     final response = await dio.get(castUrl);
  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> data = response.data;
  //       if (data.containsKey("cast")) {
  //         final List<dynamic> results = data["cast"];
  //         return results.map((cast) => CastModel.fromJson(cast)).toList();
  //       } else {
  //         throw Exception('No "cast" key in response');
  //       }
  //     } else {
  //       // log("${response.statusCode}");
  //       //throw Exception('Error function - Status Code: ${response.statusCode}');
  //       return [];
  //     }
  //   } catch (e) {
  //     return [];
  //   }
  // }
}
