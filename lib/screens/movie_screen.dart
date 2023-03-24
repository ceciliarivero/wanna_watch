import 'package:flutter/material.dart';

import '../data/movie.dart';
import '../data/movies_repository.dart';

import '../widgets/movie/movie_details.dart';
import '../widgets/shared/error_message.dart';
import '../widgets/shared/spinner.dart';

class MovieScreen extends StatefulWidget {
  final int id;
  final MoviesRepository moviesRepository;

  const MovieScreen({
    super.key,
    required this.id,
    required this.moviesRepository,
  });

  @override
  State<MovieScreen> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieScreen> {
  late Future<Movie> _movieFuture;
  late Future<List<Movie>> _watchListFuture;

  @override
  void initState() {
    super.initState();

    _watchListFuture = widget.moviesRepository.getMoviesFromWatchList();
    _movieFuture = widget.moviesRepository.getMovie(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: Future.wait([_watchListFuture, _movieFuture]),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        final List<Movie> watchList = snapshot.data?[0] ?? [];
        final Movie? movie = snapshot.data?[1];
        final Widget body;

        if (movie == null) {
          body = const Spinner();
        } else {
          bool isAdded =
              watchList.where((element) => element.id == movie.id).isNotEmpty;

          body = MovieDetails(
            moviesRepository: widget.moviesRepository,
            movie: movie,
            isAdded: isAdded,
          );
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: snapshot.hasError
              ? const ErrorMessage(
                  text: 'Something went wrong, please try again later.',
                )
              : body,
        );
      },
    );
  }
}
