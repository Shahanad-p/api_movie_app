import 'dart:convert';
import 'package:movie_app/constant/constant.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:http/http.dart' as http;

//https://api.themoviedb.org/3/movie/now_playing?
class Api {
  Future<List<Movies>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(Constant.trendingUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      // print(decodeData);
      return decodeData.map((movies) => Movies.fromJson(movies)).toList();
    } else {
      throw Exception('Got somthing erro');
    }
  }

  Future<List<Movies>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(Constant.topRatedUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      // print(decodeData);
      return decodeData.map((movies) => Movies.fromJson(movies)).toList();
    } else {
      throw Exception('Got somthing erro');
    }
  }

  Future<List<Movies>> getNowPlayingMovies() async {
    final response = await http.get(Uri.parse(Constant.nowPlayingUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      // print(decodeData);
      return decodeData.map((movies) => Movies.fromJson(movies)).toList();
    } else {
      throw Exception('Got somthing erro');
    }
  }

  Future<List<Movies>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(Constant.upcomigUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      // print(decodeData);
      return decodeData.map((movies) => Movies.fromJson(movies)).toList();
    } else {
      throw Exception('Got somthing erro');
    }
  }
}
