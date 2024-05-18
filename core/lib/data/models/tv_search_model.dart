import 'package:core/domain/entities/tv.dart';

class TvSearchModel {
  final int? page;
  final List<TvSearchResult>? tvSearchResult;
  final int? totalPages;
  final int? totalResults;

  const TvSearchModel({
    this.page,
    this.tvSearchResult,
    this.totalPages,
    this.totalResults,
  });

  factory TvSearchModel.fromJson(Map<String, dynamic> json) => TvSearchModel(
        page: json["page"],
        tvSearchResult: json["results"] == null
            ? []
            : List<TvSearchResult>.from(
                json["results"]!.map((x) => TvSearchResult.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

class TvSearchResult {
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

  const TvSearchResult({
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

  factory TvSearchResult.fromJson(Map<String, dynamic> json) => TvSearchResult(
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
}
