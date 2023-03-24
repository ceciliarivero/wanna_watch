import 'package:flutter/material.dart';

import '../../data/movie.dart';
import '../../data/movies_repository.dart';

import '../../screens/movie_screen.dart';

import './movie_list_item_info.dart';
import './movie_list_item_poster.dart';

class MovieListItem extends StatelessWidget {
  final Movie movie;
  final MoviesRepository moviesRepository;

  const MovieListItem({
    Key? key,
    required this.movie,
    required this.moviesRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieScreen(
              id: movie.id,
              moviesRepository: moviesRepository,
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
              MovieListItemPoster(imageUrl: movie.posterPath),
              Expanded(
                child: MovieListItemInfo(movie: movie),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
