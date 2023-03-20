import 'package:json_annotation/json_annotation.dart';

part 'movie_response.g.dart';

@JsonSerializable(createToJson: false)
class MovieResponse {
  final int id;
  final String? title;
  final String? overview;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'release_date')
  final String? releaseDate;

  MovieResponse({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);
}
