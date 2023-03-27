import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../data/models/movie.dart';
import '../../../data/repositories/movies_repository.dart';

import '../../../shared_widgets/error_message.dart';

import '../../../themes/design_system.dart';

class MovieBackdrop extends StatelessWidget {
  const MovieBackdrop({
    super.key,
    required this.moviesRepository,
    required this.movie,
    required this.isAdded,
    required this.addMovieToWatchList,
    required this.removeMovieFromWatchList,
  });

  final MoviesRepository moviesRepository;
  final Movie movie;
  final bool isAdded;
  final Function addMovieToWatchList;
  final Function removeMovieFromWatchList;

  static const height = 250.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: movie.backdropPath,
          fadeInDuration: const Duration(
            milliseconds: 300,
          ),
          height: height,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          imageErrorBuilder: (_, __, ___) {
            return const SizedBox(
              height: height,
              child: ErrorMessage(text: 'Image not available'),
            );
          },
        ),
        Container(
          alignment: Alignment.bottomRight,
          padding: const EdgeInsets.only(
            right: Insets.m,
            bottom: Insets.xs,
          ),
          child: ElevatedButton(
            onPressed: () {
              isAdded
                  ? removeMovieFromWatchList(movie.id)
                  : addMovieToWatchList(movie);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white70,
            ),
            child: Text(
              isAdded ? 'Remove' : 'Add',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
