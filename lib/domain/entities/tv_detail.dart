import 'package:ditonton/domain/entities/movie_detail.dart';

class TvDetail {
  bool adult;
  String backdropPath;
  dynamic belongsToCollection;
  int budget;
  String homepage;
  int id;
  String imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  int revenue;
  int runtime;
  String status;
  String tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  TvDetail({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  MovieDetail convertToMovieDetail() => MovieDetail(
        adult: adult,
        backdropPath: backdropPath,
        id: id,
        originalTitle: originalTitle,
        overview: overview,
        posterPath: posterPath,
        releaseDate: releaseDate,
        runtime: runtime,
        title: title,
        voteAverage: voteAverage,
        voteCount: voteCount,
      );
}
