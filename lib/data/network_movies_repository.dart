import './movies_repository.dart';
import './movie.dart';
import './movies_api_client.dart';

class NetworkMoviesRepository implements MoviesRepository {
  final MoviesApiClient _moviesApiClient;

  NetworkMoviesRepository(this._moviesApiClient);

  @override
  Future<List<Movie>> getMovies() async {
    final response = await _moviesApiClient.getMovies();

    return response.map((r) => Movie.fromResponse(r)).toList();
  }

  @override
  Future<Movie> getMovie(int id) async {
    final response = await _moviesApiClient.getMovie(id);
    return Movie.fromResponse(response);
  }
}
