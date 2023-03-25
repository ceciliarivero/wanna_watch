import 'package:flutter/material.dart';

import '../../data/movie.dart';
import '../../data/movies_repository.dart';

import '../../screens/movie_screen.dart';

import './movie_list_item_info.dart';
import './movie_list_item_poster.dart';

class MovieListItem extends StatefulWidget {
  final Movie movie;
  final MoviesRepository moviesRepository;
  final bool isAdded;

  const MovieListItem({
    Key? key,
    required this.movie,
    required this.moviesRepository,
    required this.isAdded,
  }) : super(key: key);

  @override
  State<MovieListItem> createState() => _MovieListItemState();
}

class _MovieListItemState extends State<MovieListItem> {
  late bool _isAdded;

  @override
  void initState() {
    super.initState();

    setState(() {
      _isAdded = widget.isAdded;
    });
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
          horizontal: 20.0,
          vertical: 5.0,
        ),
        child: Card(
          color: Theme.of(context).primaryColor,
          shadowColor: Theme.of(context).primaryColorLight,
          elevation: 10.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MovieListItemPoster(imageUrl: widget.movie.posterPath),
              Expanded(
                child: MovieListItemInfo(
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
