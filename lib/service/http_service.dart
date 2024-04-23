import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_api_movie/models/movie.dart';

class HttpService {
  final String apiKey = 'c92db2c39cfd9664d36b5ef574110dcb';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/';

  Future<List<Movie>> getNowPlayingMovies() async {
    final String uri = baseUrl + 'now_playing?api_key=' + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Success");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List<Movie> movies =
          moviesMap.map<Movie>((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("Failed to fetch popular movies");
      return [];
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final String uri = baseUrl + 'top_rated?api_key=' + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Success");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List<Movie> movies =
          moviesMap.map<Movie>((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("Failed to fetch upcoming movies");
      return [];
    }
  }

  Future<List<Movie>> getPopularMovies() async {
    final String uri = baseUrl + 'popular?api_key=' + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Success");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List<Movie> movies =
          moviesMap.map<Movie>((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("Failed to fetch top rated movies");
      return [];
    }
  }

  Future<List<Movie>> getUpcomingMovies() async {
    final String uri = baseUrl + 'upcoming?api_key=' + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Success");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List<Movie> movies =
          moviesMap.map<Movie>((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("Failed to fetch top rated movies");
      return [];
    }
  }
}
