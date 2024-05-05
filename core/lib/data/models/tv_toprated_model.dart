import 'dart:convert';

import 'package:core/domain/entities/tv.dart';

class TvTopRatedModel {
  final int? page;
  final List<TvTopRatedModelResult>? tvTopRatedModelResult;
  final int? totalPages;
  final int? totalResults;

  TvTopRatedModel({
    this.page,
    this.tvTopRatedModelResult,
    this.totalPages,
    this.totalResults,
  });

  factory TvTopRatedModel.fromJson(Map<String, dynamic> json) =>
      TvTopRatedModel(
        page: json["page"],
        tvTopRatedModelResult: json["results"] == null
            ? []
            : List<TvTopRatedModelResult>.from(
                json["results"]!.map((x) => TvTopRatedModelResult.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

class TvTopRatedModelResult {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? firstAirDate;
  final String? name;
  final double? voteAverage;
  final int? voteCount;

  TvTopRatedModelResult({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.firstAirDate,
    this.name,
    this.voteAverage,
    this.voteCount,
  });

  factory TvTopRatedModelResult.fromJson(Map<String, dynamic> json) =>
      TvTopRatedModelResult(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        id: json["id"],
        originCountry: json["origin_country"] == null
            ? []
            : List<String>.from(json["origin_country"]!.map((x) => x)),
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

  TV toEntity() {
    return TV(
      adult: adult ?? false,
      backdropPath: backdropPath ?? "",
      genreIds: genreIds ?? [],
      id: id ?? 0,
      originCountry: originCountry ?? [],
      originalLanguage: originalLanguage ?? "",
      originalName: originalName ?? "",
      overview: overview ?? "",
      popularity: popularity ?? 0,
      posterPath: posterPath ?? "",
      firstAirDate: firstAirDate ?? "",
      name: name ?? "",
      voteAverage: voteAverage ?? 0.0,
      voteCount: voteCount ?? 0,
    );
  }
}
