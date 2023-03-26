import 'package:json_annotation/json_annotation.dart';

part 'movie_response.g.dart';

@JsonSerializable(createToJson: false)
class MovieResponse {
  MovieResponse({
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

  final int? id;
  final String? title;
  final String? overview;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  final List<Map<String, dynamic>>? genres;
  @JsonKey(name: 'original_language')
  final String? originalLanguage;
  @JsonKey(name: 'original_title')
  final String? originalTitle;
  @JsonKey(name: 'production_countries')
  final List<Map<String, dynamic>>? productionCountries;

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);
}
