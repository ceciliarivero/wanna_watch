import './movie_response.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String releaseDate;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
  });

  factory Movie.fromResponse(MovieResponse response) {
    final releaseYear = response.releaseDate?.substring(0, 4) ?? '';
    final moviesApiImagesURL = dotenv.env['MOVIES_API_IMAGES_URL'];

    return Movie(
      id: response.id,
      title: response.title ?? '',
      overview: response.overview ?? '',
      posterPath: response.posterPath != null
          ? '$moviesApiImagesURL${response.posterPath}'
          : '',
      releaseDate: releaseYear,
    );
  }
}
