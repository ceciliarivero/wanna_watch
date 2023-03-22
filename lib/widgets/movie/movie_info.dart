import 'package:flutter/material.dart';

import '../../data/movie.dart';

class MovieInfo extends StatelessWidget {
  final Movie movie;

  const MovieInfo({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(right: 20.0, bottom: 20.0, left: 20.0),
      color: Theme.of(context).primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20.0),
          Text(
            movie.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 20.0),
          Wrap(
            spacing: 15.0,
            runSpacing: 10.0,
            children: movie.genres.map((genre) {
              return Chip(
                backgroundColor: Theme.of(context).cardColor,
                label: Text(genre),
                labelStyle: Theme.of(context).textTheme.bodyMedium,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              );
            }).toList(),
          ),
          const SizedBox(height: 20.0),
          Text(
            movie.overview,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 10.0),
          movie.originalTitle.isNotEmpty
              ? Text(
                  'Original title: ${movie.originalTitle}',
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              : const SizedBox(height: 0.0),
          const SizedBox(height: 10.0),
          movie.originalLanguage.isNotEmpty
              ? Text(
                  'Original language: ${movie.originalLanguage}',
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              : const SizedBox(height: 0.0),
          const SizedBox(height: 10.0),
          movie.productionCountries.isNotEmpty
              ? Text(
                  'Production: ${movie.productionCountries.join(', ')}',
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              : const SizedBox(height: 0.0),
          const SizedBox(height: 10.0),
          movie.releaseYear.isNotEmpty
              ? Text(
                  'Year: ${movie.releaseYear}',
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              : const SizedBox(height: 0.0),
        ],
      ),
    );
  }
}
