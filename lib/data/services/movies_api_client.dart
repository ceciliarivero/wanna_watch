import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../mappers/movie_response.dart';

class MoviesApiClient {
  final Dio _dio;
  final String _moviesApiKey = dotenv.env['MOVIES_API_KEY'] ?? '';

  MoviesApiClient(this._dio);

  Future<List<MovieResponse>> getMovies() async {
    final response = await _dio.get(
      'top_rated',
      queryParameters: {
        'api_key': _moviesApiKey,
        'language': 'en-UK',
        'page': 1,
      },
    );

    final items = (response.data['results']) as List<dynamic>;

    return items
        .map<MovieResponse>((item) => MovieResponse.fromJson(item))
        .toList();
  }

  Future<MovieResponse> getMovie(int id) async {
    final response = await _dio.get(
      id.toString(),
      queryParameters: {'api_key': _moviesApiKey, 'language': 'en-UK'},
    );
    return MovieResponse.fromJson(response.data);
  }
}
