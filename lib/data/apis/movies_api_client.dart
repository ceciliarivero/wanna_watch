import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../mappers/movie_response.dart';

class MoviesApiClient {
  final String _moviesApiBaseURL = dotenv.env['MOVIES_API_BASE_URL'] ?? '';
  final String _moviesApiKey = dotenv.env['MOVIES_API_KEY'] ?? '';

  Future<List<MovieResponse>> getMovies() async {
    final queryParameters = {
      'api_key': _moviesApiKey,
      'language': 'en-UK',
      'page': '1',
    };

    final moviesApiUrl =
        Uri.https(_moviesApiBaseURL, '/3/movie/top_rated', queryParameters);

    final response = await http.get(moviesApiUrl);
    final decodedBody = json.decode(response.body) as Map<String, dynamic>;

    if (response.statusCode != 200) {
      throw Error.safeToString(decodedBody['status_message']);
    }

    return decodedBody['results']
        .map<MovieResponse>((item) => MovieResponse.fromJson(item))
        .toList();
  }

  Future<MovieResponse> getMovie(int id) async {
    final queryParameters = {
      'api_key': _moviesApiKey,
      'language': 'en-UK',
    };

    final moviesApiUrl =
        Uri.https(_moviesApiBaseURL, '/3/movie/$id', queryParameters);

    final response = await http.get(moviesApiUrl);
    final decodedBody = json.decode(response.body) as Map<String, dynamic>;

    if (response.statusCode != 200) {
      throw Error.safeToString(decodedBody['status_message']);
    }

    return MovieResponse.fromJson(decodedBody);
  }
}
