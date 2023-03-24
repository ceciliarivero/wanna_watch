// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_to_watch_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieToWatchWrapperRequestBody _$MovieToWatchWrapperRequestBodyFromJson(
        Map<String, dynamic> json) =>
    MovieToWatchWrapperRequestBody(
      data: MovieToWatchRequestBody.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieToWatchWrapperRequestBodyToJson(
        MovieToWatchWrapperRequestBody instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

MovieToWatchRequestBody _$MovieToWatchRequestBodyFromJson(
        Map<String, dynamic> json) =>
    MovieToWatchRequestBody(
      id: json['id'] as int,
      title: json['title'] as String,
      overview: json['overview'] as String,
      posterPath: json['posterPath'] as String,
      releaseYear: json['releaseYear'] as String,
      backdropPath: json['backdropPath'] as String,
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      originalLanguage: json['originalLanguage'] as String,
      originalTitle: json['originalTitle'] as String,
      productionCountries: (json['productionCountries'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$MovieToWatchRequestBodyToJson(
        MovieToWatchRequestBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'posterPath': instance.posterPath,
      'releaseYear': instance.releaseYear,
      'backdropPath': instance.backdropPath,
      'genres': instance.genres,
      'originalLanguage': instance.originalLanguage,
      'originalTitle': instance.originalTitle,
      'productionCountries': instance.productionCountries,
    };
