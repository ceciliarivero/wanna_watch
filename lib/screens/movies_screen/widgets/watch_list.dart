import 'package:flutter/material.dart';

import '../../../data/models/movie.dart';
import '../../../data/repositories/movies_repository.dart';

import '../../../shared_widgets/error_message.dart';
import '../../../shared_widgets/spinner.dart';
import './movie_tile/movie_tile.dart';

class WatchList extends StatefulWidget {
  const WatchList({
    super.key,
    required this.watchListFuture,
    required this.moviesRepository,
  });

  final Future<List<Movie>> watchListFuture;
  final MoviesRepository moviesRepository;

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  late Future<List<Movie>> _watchListFuture;

  @override
  void initState() {
    super.initState();

    _watchListFuture = widget.watchListFuture;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      future: _watchListFuture,
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
        if (snapshot.connectionState != ConnectionState.done ||
            !snapshot.hasData) {
          return const Spinner();
        }

        if (snapshot.hasError) {
          return const ErrorMessage(
            text: 'Something went wrong, please try again later.',
          );
        }

        final List<Movie> watchList = snapshot.data ?? [];

        if (watchList.isEmpty) {
          return const ErrorMessage(
            text: 'No movies added',
          );
        }

        return Container(
          color: Theme.of(context).primaryColor,
          child: ListView.builder(
            itemCount: watchList.length,
            itemBuilder: (ctx, index) {
              return MovieTile(
                movie: watchList[index],
                moviesRepository: widget.moviesRepository,
                isAdded: true,
              );
            },
          ),
        );
      },
    );
  }
}
