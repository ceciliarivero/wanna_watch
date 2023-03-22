import 'package:flutter/material.dart';

import '../../data/movie.dart';

import './movie_backdrop.dart';
import './movie_info.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;

  const MovieDetails({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            MovieBackdrop(imageUrl: movie.backdropPath),
            MovieInfo(movie: movie),
          ],
        ),
      ),
    );
  }
}
