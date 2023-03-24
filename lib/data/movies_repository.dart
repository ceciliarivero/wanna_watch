import './movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getMovies();
  Future<Movie> getMovie(int id);
  Future<void> addMovieToWatchList(Movie movie);
  Future<void> removeMovieFromWatchList(int id);
  Future<List<Movie>> getMoviesFromWatchList();
}
