import 'package:flutter_dotenv/flutter_dotenv.dart';

import './movie_response.dart';
import './movie_to_watch_response.dart';

class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String releaseYear;
  final String backdropPath;
  final List<String> genres;
  final String originalLanguage;
  final String originalTitle;
  final List<String> productionCountries;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseYear,
    required this.backdropPath,
    required this.genres,
    required this.originalLanguage,
    required this.originalTitle,
    required this.productionCountries,
  });

  factory Movie.fromResponse(MovieResponse response) {
    final moviesApiImagesURL = dotenv.env['MOVIES_API_IMAGES_URL'];
    final releaseYear = response.releaseDate?.substring(0, 4) ?? '';
    final genres =
        response.genres?.map((genre) => genre['name'].toString()).toList() ??
            [];
    final productionCountries = response.productionCountries
            ?.map((productionCountry) => productionCountry['name'].toString())
            .toList() ??
        [];

    return Movie(
      id: response.id ?? 0,
      title: response.title ?? '',
      overview: response.overview ?? '',
      posterPath: response.posterPath != null
          ? '$moviesApiImagesURL${response.posterPath}'
          : '',
      releaseYear: releaseYear,
      backdropPath: response.backdropPath != null
          ? '$moviesApiImagesURL${response.backdropPath}'
          : '',
      genres: genres,
      originalLanguage: response.originalLanguage ?? '',
      originalTitle: response.originalTitle ?? '',
      productionCountries: productionCountries,
    );
  }

  factory Movie.fromMovieToWatchResponse(MovieToWatchResponse response) {
    final moviesApiImagesURL = dotenv.env['MOVIES_API_IMAGES_URL'];
    final releaseYear = response.releaseDate?.substring(0, 4) ?? '';
    final genres = response.genres ?? [];
    final productionCountries = response.productionCountries ?? [];

    return Movie(
      id: response.id ?? 0,
      title: response.title ?? '',
      overview: response.overview ?? '',
      posterPath: response.posterPath != null
          ? '$moviesApiImagesURL${response.posterPath}'
          : '',
      releaseYear: releaseYear,
      backdropPath: response.backdropPath != null
          ? '$moviesApiImagesURL${response.backdropPath}'
          : '',
      genres: genres,
      originalLanguage: response.originalLanguage ?? '',
      originalTitle: response.originalTitle ?? '',
      productionCountries: productionCountries,
    );
  }
}
