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
  Future<List<Movie>>? _moviesFuture;

  @override
  void initState() {
    super.initState();

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
          moviesFuture: _moviesFuture,
        ),
      ),
    );
  }
}
