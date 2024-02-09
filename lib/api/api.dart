import 'dart:convert';
import 'package:movie_app/api/constant/constant.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:http/http.dart' as http;

//https://api.themoviedb.org/3/movie/now_playing?
class Api {
  static const _trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constant.apiKey}';

  static const _topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constant.apiKey}';

  static const _nowPlayingUrl =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=${Constant.apiKey}';

  static const _upcomigUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constant.apiKey}';

  Future<List<Movies>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      // print(decodeData);
      return decodeData
          .map((movies) => Movies.fromJson(movies))
          .toList();
    } else {
      throw Exception('Got somthing erro');
    }
  }

  Future<List<Movies>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topRatedUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      // print(decodeData);
      return decodeData
          .map((movies) => Movies.fromJson(movies))
          .toList();
    } else {
      throw Exception('Got somthing erro');
    }
  }

  Future<List<Movies>> getNowPlayingMovies() async {
    final response = await http.get(Uri.parse(_nowPlayingUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      // print(decodeData);
      return decodeData
          .map((movies) => Movies.fromJson(movies))
          .toList();
    } else {
      throw Exception('Got somthing erro');
    }
  }

  Future<List<Movies>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(_upcomigUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      // print(decodeData);
      return decodeData
          .map((movies) => Movies.fromJson(movies))
          .toList();
    } else {
      throw Exception('Got somthing erro');
    }
  }
}
