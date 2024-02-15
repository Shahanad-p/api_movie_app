// ignore_for_file: deprecated_member_use
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/cast_mode.dart';
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

  Future<List<Movies>> searchMovie({required String searchUrl}) async {
    try {
      final response = await dio.get(searchUrl);
      if (response.statusCode == 200) {
        final Map<String, dynamic> searchData = response.data;
        final List<dynamic> searchMovies = searchData["results"];
        return searchMovies.map((search) => Movies.fromJson(search)).toList();
      } else {
        // print('Error: ${response.statusCode} - ${response.statusMessage}');
        return [];
      }
    } on DioError {
      // print('Dio Error: ${e.message}');
      return [];
    } catch (e) {
      // print("Error: $e");
      return [];
    }
  }

  Future<List<CastModel>> getCast(
      {required String castUrl, required BuildContext context}) async {
    try {
      final response = await dio.get(castUrl);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        if (data.containsKey("cast")) {
          final List<dynamic> results = data["cast"];
          return results.map((cast) => CastModel.fromJson(cast)).toList();
        } else {
          throw Exception('No "cast" key in response');
        }
      } else {
        // log("${response.statusCode}");
        //throw Exception('Error function - Status Code: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
