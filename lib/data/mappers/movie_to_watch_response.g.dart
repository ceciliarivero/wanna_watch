// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_to_watch_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieToWatchResponse _$MovieToWatchResponseFromJson(
        Map<String, dynamic> json) =>
    MovieToWatchResponse(
      id: json['id'] as int?,
      title: json['title'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['posterPath'] as String?,
      releaseDate: json['releaseDate'] as String?,
      backdropPath: json['backdropPath'] as String?,
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      originalLanguage: json['originalLanguage'] as String?,
      originalTitle: json['originalTitle'] as String?,
      productionCountries: (json['productionCountries'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );
