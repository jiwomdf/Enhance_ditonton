import 'dart:convert';

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

  factory TvTopRatedModel.fromRawJson(String str) =>
      TvTopRatedModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": tvTopRatedModelResult == null
            ? []
            : List<dynamic>.from(tvTopRatedModelResult!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class TvTopRatedModelResult {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final List<String>? originCountry;
  final OriginalLanguage? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final DateTime? firstAirDate;
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

  factory TvTopRatedModelResult.fromRawJson(String str) =>
      TvTopRatedModelResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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
        originalLanguage:
            originalLanguageValues.map[json["original_language"]]!,
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        firstAirDate: json["first_air_date"] == null
            ? null
            : DateTime.parse(json["first_air_date"]),
        name: json["name"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids":
            genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "origin_country": originCountry == null
            ? []
            : List<dynamic>.from(originCountry!.map((x) => x)),
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "first_air_date":
            "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
        "name": name,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}

enum OriginalLanguage { EN, JA, KO }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "ja": OriginalLanguage.JA,
  "ko": OriginalLanguage.KO
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
