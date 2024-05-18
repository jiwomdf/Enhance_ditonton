import 'package:core/domain/entities/tv_recommendation.dart';

class TvRecommendationModel {
  final int? page;
  final List<TvRecommendationResult>? tvRecommendationResult;
  final int? totalPages;
  final int? totalResults;

  const TvRecommendationModel({
    this.page,
    this.tvRecommendationResult,
    this.totalPages,
    this.totalResults,
  });

  factory TvRecommendationModel.fromJson(Map<String, dynamic> json) =>
      TvRecommendationModel(
        page: json["page"],
        tvRecommendationResult: json["results"] == null
            ? []
            : List<TvRecommendationResult>.from(json["results"]!
                .map((x) => TvRecommendationResult.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": tvRecommendationResult == null
            ? []
            : List<dynamic>.from(
                tvRecommendationResult!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class TvRecommendationResult {
  final bool? adult;
  final String? backdropPath;
  final int? id;
  final String? name;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final String? posterPath;
  final String? mediaType;
  final List<int>? genreIds;
  final double? popularity;
  final String? firstAirDate;
  final double? voteAverage;
  final int? voteCount;
  final List<String>? originCountry;

  const TvRecommendationResult({
    this.adult,
    this.backdropPath,
    this.id,
    this.name,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.genreIds,
    this.popularity,
    this.firstAirDate,
    this.voteAverage,
    this.voteCount,
    this.originCountry,
  });

  factory TvRecommendationResult.fromJson(Map<String, dynamic> json) =>
      TvRecommendationResult(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        id: json["id"],
        name: json["name"],
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        mediaType: json["media_type"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        popularity: json["popularity"]?.toDouble(),
        firstAirDate: json["first_air_date"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        originCountry: json["origin_country"] == null
            ? []
            : List<String>.from(json["origin_country"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "id": id,
        "name": name,
        "original_language": originalLanguage,
        "original_name": originalName,
        "overview": overview,
        "poster_path": posterPath,
        "media_type": mediaType,
        "genre_ids":
            genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "popularity": popularity,
        "first_air_date": firstAirDate,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "origin_country": originCountry == null
            ? []
            : List<dynamic>.from(originCountry!.map((x) => x)),
      };

  TvRecomemendation toEntity() {
    return TvRecomemendation(
      adult: adult ?? false,
      backdropPath: backdropPath ?? "",
      id: id ?? 0,
      name: name ?? "",
      originalLanguage: originalLanguage ?? "",
      originalName: originalName ?? "",
      overview: overview ?? "",
      posterPath: posterPath ?? "",
      genreIds: genreIds,
      popularity: popularity ?? 0.0,
      firstAirDate: firstAirDate ?? "",
      voteAverage: voteAverage ?? 0.0,
      voteCount: voteCount ?? 0,
      originCountry: originCountry,
    );
  }
}
