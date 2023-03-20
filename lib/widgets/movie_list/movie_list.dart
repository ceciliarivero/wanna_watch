import 'package:flutter/material.dart';

import '../../data/movie.dart';
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
          return Container(
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Text(
                'Something went wrong, please try again later',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          );
        }

        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColorLight,
            ),
          );
        }

        final movies = snapshot.data ?? [];

        if (movies.isEmpty) {
          return Container(
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Text(
                'No movies available',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
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
