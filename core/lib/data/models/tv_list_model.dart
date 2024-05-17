// To parse this JSON data, do
//
//     final listTvModel = listTvModelFromJson(jsonString);

import 'package:core/domain/entities/tv.dart';

class ListTvModel {
  int page;
  List<TvModel> tvListModel;
  int totalPages;
  int totalResults;

  ListTvModel({
    required this.page,
    required this.tvListModel,
    required this.totalPages,
    required this.totalResults,
  });

  factory ListTvModel.fromJson(Map<String, dynamic> json) => ListTvModel(
        page: json["page"],
        tvListModel:
            List<TvModel>.from(json["results"].map((x) => TvModel.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

class TvModel {
  bool adult;
  String? backdropPath;
  List<int> genreIds;
  int id;
  List<String> originCountry;
  String originalLanguage;
  String originalName;
  String overview;
  double popularity;
  String posterPath;
  String firstAirDate;
  String name;
  double voteAverage;
  int voteCount;

  TvModel({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  factory TvModel.fromJson(Map<String, dynamic> json) => TvModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originCountry: List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        firstAirDate: json["first_air_date"],
        name: json["name"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  TV toEntity() => TV(
        adult: adult,
        backdropPath: backdropPath,
        genreIds: genreIds,
        id: id,
        originCountry: originCountry,
        originalLanguage: originalLanguage,
        originalName: originalName,
        overview: overview,
        popularity: popularity,
        posterPath: posterPath,
        firstAirDate: firstAirDate,
        name: name,
        voteAverage: voteAverage,
        voteCount: voteCount,
      );
}
