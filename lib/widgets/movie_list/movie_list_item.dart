import 'package:flutter/material.dart';

import '../../data/movie.dart';
import './movie_list_item_info.dart';
import './movie_list_item_poster.dart';

class MovieListItem extends StatelessWidget {
  final Movie movie;

  const MovieListItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 5.0,
        ),
        child: Card(
          color: Theme.of(context).primaryColor,
          shadowColor: Theme.of(context).primaryColorLight,
          elevation: 30,
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
