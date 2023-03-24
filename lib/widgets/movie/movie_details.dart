import 'package:flutter/material.dart';

import '../../data/movie.dart';
import '../../data/movies_repository.dart';

import './movie_backdrop.dart';
import './movie_info.dart';

class MovieDetails extends StatefulWidget {
  final MoviesRepository moviesRepository;
  final Movie movie;
  final bool isAdded;

  const MovieDetails({
    super.key,
    required this.moviesRepository,
    required this.movie,
    required this.isAdded,
  });

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  late bool _isAdded;

  @override
  void initState() {
    super.initState();

    setState(() {
      _isAdded = widget.isAdded;
    });
  }

  void addMovieToWatchList(Movie movie) {
    widget.moviesRepository.addMovieToWatchList(movie);

    setState(() {
      _isAdded = true;
    });
  }

  void removeMovieFromWatchList(int id) {
    widget.moviesRepository.removeMovieFromWatchList(id);

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
              addMovieToWatchList: addMovieToWatchList,
              removeMovieFromWatchList: removeMovieFromWatchList,
            ),
            MovieInfo(movie: widget.movie),
          ],
        ),
      ),
    );
  }
}
