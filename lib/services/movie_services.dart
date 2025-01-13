import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class MovieService {
  static const String baseUrl = 'https://api.tvmaze.com';

  /// Fetch movies with pagination.
  static Future<List<Movie>> fetchMovies({required int page}) async {
    final response = await http.get(Uri.parse('$baseUrl/search/shows?q=all&page=$page'));

    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      return jsonResponse.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }


  static Future<Map<String, List<Movie>>> fetchMoviesGroupedByGenre() async {
    final response = await http.get(Uri.parse('$baseUrl/shows'));

    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      final List<Movie> movies = jsonResponse.map((movie) => Movie.fromJson(movie)).toList();

      // Group movies by genre
      final Map<String, List<Movie>> moviesByGenre = {};
      for (var movie in movies) {
        final genres = movie.show?.genres ?? [];
        for (var genre in genres) {
          if (!moviesByGenre.containsKey(genre)) {
            moviesByGenre[genre] = [];
          }
          moviesByGenre[genre]!.add(movie);
        }
      }
      return moviesByGenre;
    } else {
      throw Exception('Failed to fetch movies grouped by genre');
    }
  }

  /// Fetch movies by a specific genre.
  static Future<List<Movie>> fetchMoviesByGenre(String genre) async {
    final response = await http.get(Uri.parse('$baseUrl/shows'));

    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      final List<Movie> movies = jsonResponse.map((movie) => Movie.fromJson(movie)).toList();

      // Filter movies by the specified genre
      return movies.where((movie) => movie.show?.genres?.contains(genre) ?? false).toList();
    } else {
      throw Exception('Failed to fetch movies by genre');
    }
  }
}
