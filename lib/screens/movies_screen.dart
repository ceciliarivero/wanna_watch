import 'package:flutter/material.dart';

import '../data/movie.dart';
import '../data/movies_repository.dart';

import '../widgets/movie_list/movie_list.dart';

class MoviesScreen extends StatefulWidget {
  final MoviesRepository moviesRepository;

  const MoviesScreen({
    super.key,
    required this.moviesRepository,
  });

  @override
  State<MoviesScreen> createState() => _MoviesState();
}

class _MoviesState extends State<MoviesScreen> {
  late Future<List<Movie>> _watchListFuture;
  late Future<List<Movie>> _moviesFuture;

  @override
  void initState() {
    super.initState();

    _watchListFuture = widget.moviesRepository.getMoviesFromWatchList();
    _moviesFuture = widget.moviesRepository.getMovies();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Wanna Watch'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: MovieList(
          watchListFuture: _watchListFuture,
          moviesFuture: _moviesFuture,
          moviesRepository: widget.moviesRepository,
        ),
      ),
    );
  }
}
