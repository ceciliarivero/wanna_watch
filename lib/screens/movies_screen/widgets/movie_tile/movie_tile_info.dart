import 'package:flutter/material.dart';

import '../../../../data/models/movie.dart';

import './add_checkbox.dart';

import '../../../../themes/design_system.dart';

class MovieTileInfo extends StatelessWidget {
  const MovieTileInfo({
    Key? key,
    required this.movie,
    required this.isAdded,
    required this.addMovieToWatchList,
    required this.removeMovieFromWatchList,
  }) : super(key: key);

  final Movie movie;
  final bool isAdded;
  final Function addMovieToWatchList;
  final Function removeMovieFromWatchList;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Insets.s),
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
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: Insets.xxs,
                  ),
                  Text(
                    movie.releaseYear,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: Insets.xxs,
                  ),
                  Text(
                    movie.overview,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Container(
              width: 35,
              alignment: Alignment.centerRight,
              child: AddCheckbox(
                isAdded: isAdded,
                add: () => addMovieToWatchList(movie),
                remove: () => removeMovieFromWatchList(movie.id),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
