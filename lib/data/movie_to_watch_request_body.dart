import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_to_watch_request_body.g.dart';

@JsonSerializable(createToJson: true, explicitToJson: true)
class MovieToWatchWrapperRequestBody extends Equatable {
  final MovieToWatchRequestBody data;

  const MovieToWatchWrapperRequestBody({
    required this.data,
  });

  factory MovieToWatchWrapperRequestBody.fromJson(Map<String, dynamic> json) =>
      _$MovieToWatchWrapperRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToWatchWrapperRequestBodyToJson(this);

  @override
  List<Object?> get props => [data];
}

@JsonSerializable(createToJson: true)
class MovieToWatchRequestBody extends Equatable {
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

  const MovieToWatchRequestBody({
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

  factory MovieToWatchRequestBody.fromJson(Map<String, dynamic> json) =>
      _$MovieToWatchRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToWatchRequestBodyToJson(this);

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        posterPath,
        releaseYear,
        backdropPath,
        genres,
        originalLanguage,
        originalTitle,
        productionCountries,
      ];
}
