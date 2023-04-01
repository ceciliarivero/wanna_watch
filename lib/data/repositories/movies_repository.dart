import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../firebase_options.dart';

import '../apis/db_api_client.dart';
import '../apis/movies_api_client.dart';
import '../mappers/movie_to_watch_request_body.dart';
import '../models/movie.dart';

class MoviesRepository {
  MoviesRepository(
    this._moviesApiClient,
    this._dbApiClient,
  );

  final MoviesApiClient _moviesApiClient;
  final DBApiClient _dbApiClient;

  Future<List<Movie>> getMovies() async {
    final response = await _moviesApiClient.getMovies();

    return response.map((r) => Movie.fromResponse(r)).toList();
  }

  Future<Movie> getMovie(int id) async {
    final response = await _moviesApiClient.getMovie(id);
    return Movie.fromResponse(response);
  }

  Future<void> addMovieToWatchList(Movie movie) async {
    final body = MovieToWatchWrapperRequestBody(
      data: MovieToWatchRequestBody(
        id: movie.id,
        title: movie.title,
        overview: movie.overview,
        posterPath: movie.posterPath,
        releaseYear: movie.releaseYear,
        backdropPath: movie.backdropPath,
        genres: movie.genres,
        originalLanguage: movie.originalLanguage,
        originalTitle: movie.originalTitle,
        productionCountries: movie.productionCountries,
      ),
    );
    await _dbApiClient.addMovieToWatchList(body);
  }

  Future<void> removeMovieFromWatchList(int id) async {
    await _dbApiClient.removeMovieFromWatchList(id);
  }

  Future<List<Movie>> getMoviesFromWatchList() async {
    final response = await _dbApiClient.getMoviesFromWatchList();

    return response.map((r) => Movie.fromMovieToWatchResponse(r)).toList();
  }
}

Future<MoviesRepository> initMoviesRepository() async {
  await dotenv.load(fileName: ".env");
  final moviesApiBaseURL = dotenv.env['MOVIES_API_BASE_URL'];

  // Movies Api
  final moviesDio = Dio(
    BaseOptions(baseUrl: moviesApiBaseURL ?? ''),
  );

  final moviesApiClient = MoviesApiClient(moviesDio);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Watch List DB
  final FirebaseFirestore dbInstance = FirebaseFirestore.instance;

  final dbApiClient = DBApiClient(dbInstance);

  return MoviesRepository(moviesApiClient, dbApiClient);
}
