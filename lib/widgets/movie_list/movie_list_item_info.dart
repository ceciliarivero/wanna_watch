import 'package:flutter/material.dart';

import '../../data/models/movie.dart';

class MovieListItemInfo extends StatelessWidget {
  final Movie movie;
  final bool isAdded;
  final Function addMovieToWatchList;
  final Function removeMovieFromWatchList;

  const MovieListItemInfo({
    Key? key,
    required this.movie,
    required this.isAdded,
    required this.addMovieToWatchList,
    required this.removeMovieFromWatchList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    movie.releaseYear,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    movie.overview,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Container(
              width: 35,
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  isAdded
                      ? removeMovieFromWatchList(movie.id)
                      : addMovieToWatchList(movie);
                },
                icon: Icon(
                  isAdded ? Icons.check_circle : Icons.check_circle_outline,
                  color: isAdded
                      ? Theme.of(context).primaryColorLight
                      : Theme.of(context).canvasColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
