import 'package:flutter/material.dart';
import 'package:wanna_watch/themes/design_system.dart';

import '../../../../data/models/movie.dart';
import '../../../../data/repositories/movies_repository.dart';

import '../../../movie_screen/movie_screen.dart';
import './movie_poster.dart';
import './movie_tile_info.dart';

class MovieTile extends StatefulWidget {
  const MovieTile({
    Key? key,
    required this.movie,
    required this.moviesRepository,
    required this.isAdded,
  }) : super(key: key);

  final Movie movie;
  final MoviesRepository moviesRepository;
  final bool isAdded;

  @override
  State<MovieTile> createState() => _MovieTile();
}

class _MovieTile extends State<MovieTile> {
  late bool _isAdded;

  @override
  void initState() {
    super.initState();

    _isAdded = widget.isAdded;
  }

  void _addMovieToWatchList(Movie movie) {
    widget.moviesRepository.addMovieToWatchList(movie);

    setState(() {
      _isAdded = true;
    });
  }

  void _removeMovieFromWatchList(int id) {
    widget.moviesRepository.removeMovieFromWatchList(id);

    setState(() {
      _isAdded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieScreen(
              id: widget.movie.id,
              moviesRepository: widget.moviesRepository,
              isAdded: _isAdded,
              addMovieToWatchList: _addMovieToWatchList,
              removeMovieFromWatchList: _removeMovieFromWatchList,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: Insets.m,
          vertical: Insets.xxs,
        ),
        child: Card(
          color: theme.primaryColor,
          shadowColor: theme.primaryColorLight,
          elevation: 10.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MoviePoster(imagePath: widget.movie.posterPath),
              Expanded(
                child: MovieTileInfo(
                  movie: widget.movie,
                  isAdded: _isAdded,
                  addMovieToWatchList: _addMovieToWatchList,
                  removeMovieFromWatchList: _removeMovieFromWatchList,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
