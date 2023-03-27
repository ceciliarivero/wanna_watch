import 'package:flutter/material.dart';

import '../../../data/models/movie.dart';

import '../../../themes/design_system.dart';

class MovieInfo extends StatelessWidget {
  const MovieInfo({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
          right: Insets.m, bottom: Insets.m, left: Insets.m),
      color: theme.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: Insets.m),
          Text(
            movie.title,
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: Insets.m),
          Wrap(
            spacing: Insets.s,
            runSpacing: Insets.xs,
            children: movie.genres.map((genre) {
              return Chip(
                backgroundColor: theme.cardColor,
                label: Text(genre),
                labelStyle: theme.textTheme.bodyMedium,
                labelPadding: const EdgeInsets.symmetric(
                    horizontal: Insets.s, vertical: Insets.xxs),
              );
            }).toList(),
          ),
          const SizedBox(height: Insets.m),
          if (movie.overview.isNotEmpty) ...[
            Text(
              movie.overview,
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: Insets.s),
          ],
          if (movie.originalTitle.isNotEmpty) ...[
            Text(
              'Original title: ${movie.originalTitle}',
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: Insets.s),
          ],
          if (movie.originalLanguage.isNotEmpty) ...[
            Text(
              'Original language: ${movie.originalLanguage}',
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: Insets.s),
          ],
          if (movie.productionCountries.isNotEmpty) ...[
            Text(
              'Production: ${movie.productionCountries.join(', ')}',
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: Insets.s),
          ],
          if (movie.releaseYear.isNotEmpty) ...[
            Text(
              'Year: ${movie.releaseYear}',
              style: theme.textTheme.bodyLarge,
            ),
          ],
        ],
      ),
    );
  }
}
