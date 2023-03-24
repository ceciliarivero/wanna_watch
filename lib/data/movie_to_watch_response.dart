import 'package:json_annotation/json_annotation.dart';

part 'movie_to_watch_response.g.dart';

@JsonSerializable(createToJson: false)
class MovieToWatchResponse {
  final int? id;
  final String? title;
  final String? overview;
  final String? posterPath;
  final String? releaseDate;
  final String? backdropPath;
  final List<String>? genres;
  final String? originalLanguage;
  final String? originalTitle;
  final List<String>? productionCountries;

  MovieToWatchResponse({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.backdropPath,
    required this.genres,
    required this.originalLanguage,
    required this.originalTitle,
    required this.productionCountries,
  });

  factory MovieToWatchResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieToWatchResponseFromJson(json);
}
