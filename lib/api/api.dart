import 'dart:convert';
import 'package:movie_app/api/constant/constant.dart';
import 'package:movie_app/models/trending_model.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constant.apiKey}';

  Future<List<TrendingMovies>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      print(decodeData);
      return decodeData
          .map((movies) => TrendingMovies.fromJson(movies))
          .toList();
    } else {
      throw Exception('Got somthing erro');
    }
  }
}
