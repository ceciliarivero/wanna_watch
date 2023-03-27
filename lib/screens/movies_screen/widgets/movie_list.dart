import 'package:flutter/material.dart';

import '../../../data/models/movie.dart';
import '../../../data/repositories/movies_repository.dart';

import '../../../shared_widgets/error_message.dart';
import '../../../shared_widgets/spinner.dart';
import './movie_tile/movie_tile.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    super.key,
    required this.watchListFuture,
    required this.moviesFuture,
    required this.moviesRepository,
  });

  final Future<List<Movie>> watchListFuture;
  final Future<List<Movie>> moviesFuture;
  final MoviesRepository moviesRepository;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: Future.wait([watchListFuture, moviesFuture]),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasError) {
          return const ErrorMessage(
            text: 'Something went wrong, please try again later.',
          );
        }

        if (!snapshot.hasData) {
          return const Spinner();
        }

        final List<Movie> watchList = snapshot.data?[0] ?? [];
        final List<Movie> movies = snapshot.data?[1] ?? [];

        if (movies.isEmpty) {
          return const ErrorMessage(
            text: 'No movies available',
          );
        }

        return Container(
          color: Theme.of(context).primaryColor,
          child: ListView.builder(
            itemCount: movies.length,
            itemBuilder: (ctx, index) {
              bool isAdded = watchList
                  .where((element) => element.id == movies[index].id)
                  .isNotEmpty;

              return MovieTile(
                movie: movies[index],
                moviesRepository: moviesRepository,
                isAdded: isAdded,
              );
            },
          ),
        );
      },
    );
  }
}
