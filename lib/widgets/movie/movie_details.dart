import 'package:flutter/material.dart';

import '../../data/models/movie.dart';
import '../../data/services/movies_repository.dart';

import './movie_backdrop.dart';
import './movie_info.dart';

class MovieDetails extends StatefulWidget {
  final MoviesRepository moviesRepository;
  final Movie movie;
  final bool isAdded;
  final Function addMovieToWatchList;
  final Function removeMovieFromWatchList;

  const MovieDetails({
    super.key,
    required this.moviesRepository,
    required this.movie,
    required this.isAdded,
    required this.addMovieToWatchList,
    required this.removeMovieFromWatchList,
  });

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  late bool _isAdded;

  @override
  void initState() {
    super.initState();

    _isAdded = widget.isAdded;
  }

  void _addMovie(Movie movie) {
    widget.addMovieToWatchList(movie);

    setState(() {
      _isAdded = true;
    });
  }

  void _removeMovie(int id) {
    widget.removeMovieFromWatchList(id);

    setState(() {
      _isAdded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            MovieBackdrop(
              moviesRepository: widget.moviesRepository,
              movie: widget.movie,
              isAdded: _isAdded,
              addMovieToWatchList: _addMovie,
              removeMovieFromWatchList: _removeMovie,
            ),
            MovieInfo(movie: widget.movie),
          ],
        ),
      ),
    );
  }
}
