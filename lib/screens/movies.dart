import 'package:flutter/material.dart';

import '../data/movie.dart';
import '../data/movies_repository.dart';

import '../widgets/movie_list/movie_list.dart';

class Movies extends StatefulWidget {
  final MoviesRepository moviesRepository;

  const Movies({
    super.key,
    required this.moviesRepository,
  });

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
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
        title: const Center(
          child: Text('Wanna Watch'),
        ),
      ),
      body: SafeArea(
        child: MovieList(moviesFuture: _moviesFuture),
      ),
    );
  }
}
