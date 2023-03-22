import 'package:flutter/material.dart';

import '../../data/movie.dart';
import '../shared/spinner.dart';
import '../shared/error.dart';
import './movie_list_item.dart';

class MovieList extends StatelessWidget {
  final Future<List<Movie>>? moviesFuture;

  const MovieList({
    super.key,
    required this.moviesFuture,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      future: moviesFuture,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Error(
            text: 'Something went wrong, please try again later.',
          );
        }

        if (!snapshot.hasData) {
          return const Spinner();
        }

        final movies = snapshot.data ?? [];

        if (movies.isEmpty) {
          return const Error(
            text: 'No movies available',
          );
        }

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (ctx, index) {
            return MovieListItem(
              movie: movies[index],
            );
          },
        );
      },
    );
  }
}
