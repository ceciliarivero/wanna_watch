import '../apis/db_client.dart';
import '../apis/movies_api_client.dart';
import '../mappers/movie_to_watch_request_body.dart';
import '../models/movie.dart';

class MoviesRepository {
  MoviesRepository(
    this._moviesApiClient,
    this._dbClient,
  );

  final MoviesApiClient _moviesApiClient;
  final DBClient _dbClient;

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
    await _dbClient.addMovieToWatchList(body);
  }

  Future<void> removeMovieFromWatchList(int id) async {
    await _dbClient.removeMovieFromWatchList(id);
  }

  Future<List<Movie>> getMoviesFromWatchList() async {
    final response = await _dbClient.getMoviesFromWatchList();

    return response.map((r) => Movie.fromMovieToWatchResponse(r)).toList();
  }
}
