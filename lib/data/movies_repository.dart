import './movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getMovies();
}