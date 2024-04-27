import 'package:core/data/models/movie_table.dart';
import 'package:core/data/models/tv_airing_today_model.dart';
import 'package:core/data/models/tv_popular_model.dart';
import 'package:core/data/models/tv_recommendation_dart.dart';
import 'package:core/data/models/tv_search_model.dart';
import 'package:core/data/models/tv_table.dart';
import 'package:core/data/models/tv_toprated_model.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:core/domain/entities/movie_detail.dart';
import 'package:core/domain/entities/tv.dart';
import 'package:core/domain/entities/tv_detail.dart';
import 'package:core/domain/entities/tv_recommendation.dart';

final testMovie = Movie(
  adult: false,
  backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  genreIds: [14, 28],
  id: 557,
  originalTitle: 'Spider-Man',
  overview:
      'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  popularity: 60.441,
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  releaseDate: '2002-05-01',
  title: 'Spider-Man',
  video: false,
  voteAverage: 7.2,
  voteCount: 13507,
);

final testMovieList = [testMovie];

const testMovieDetail = MovieDetail(
  adult: false,
  backdropPath: 'backdropPath',
  id: 1,
  originalTitle: 'originalTitle',
  overview: 'overview',
  posterPath: 'posterPath',
  releaseDate: 'releaseDate',
  runtime: 120,
  title: 'title',
  voteAverage: 1,
  voteCount: 1,
);

final testWatchlistMovie = Movie.watchlist(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

const testMovieTable = MovieTable(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testMovieMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
};

final testTv = TV(
  adult: false,
  backdropPath: "",
  genreIds: [1],
  id: 1,
  originCountry: ["originCountry"],
  originalLanguage: "originalLanguage",
  originalName: "originalName",
  overview: "overview",
  popularity: 0.1,
  posterPath: "posterPath",
  firstAirDate: "firstAirDate",
  name: "name",
  voteAverage: 1.0,
  voteCount: 1,
);

final testTvSearchResult = TvSearchResult(
  adult: false,
  backdropPath: "",
  genreIds: [1],
  id: 1,
  originCountry: ["originCountry"],
  originalLanguage: "originalLanguage",
  originalName: "originalName",
  overview: "overview",
  popularity: 0.1,
  posterPath: "posterPath",
  firstAirDate: "firstAirDate",
  name: "name",
  voteAverage: 1.0,
  voteCount: 1,
);

final testTvAiringTodayModelResult = TvAiringTodayModelResult(
  adult: false,
  backdropPath: "",
  genreIds: [1],
  id: 1,
  originCountry: ["originCountry"],
  originalLanguage: "originalLanguage",
  originalName: "originalName",
  overview: "overview",
  popularity: 0.1,
  posterPath: "posterPath",
  firstAirDate: "firstAirDate",
  name: "name",
  voteAverage: 1.0,
  voteCount: 1,
);

final testTvTopRatedModelResult = TvTopRatedModelResult(
  adult: false,
  backdropPath: "",
  genreIds: [1],
  id: 1,
  originCountry: ["originCountry"],
  originalLanguage: "originalLanguage",
  originalName: "originalName",
  overview: "overview",
  popularity: 0.1,
  posterPath: "posterPath",
  firstAirDate: "firstAirDate",
  name: "name",
  voteAverage: 1.0,
  voteCount: 1,
);

final testTvSeriesPopularResult = TvSeriesPopularResult(
  adult: false,
  backdropPath: "",
  genreIds: [1],
  id: 1,
  originCountry: ["originCountry"],
  originalLanguage: "originalLanguage",
  originalName: "originalName",
  overview: "overview",
  popularity: 0.1,
  posterPath: "posterPath",
  firstAirDate: "firstAirDate",
  name: "name",
  voteAverage: 1.0,
  voteCount: 1,
);

final testTvDetail = TvDetail(
  adult: false,
  backdropPath: "backdropPath",
  belongsToCollection: "belongsToCollection",
  budget: 1,
  homepage: "homepage",
  id: 1,
  imdbId: "imdbId",
  originalLanguage: "originalLanguage",
  originalTitle: "originalTitle",
  overview: "overview",
  popularity: 1.0,
  posterPath: "posterPath",
  releaseDate: "releaseDate",
  revenue: 1,
  runtime: 1,
  status: "status",
  tagline: "tagline",
  title: "title",
  video: false,
  voteAverage: 1.0,
  voteCount: 1,
);

const testTvTable = TvTable(
  id: 1,
  title: "title",
  posterPath: "posterPath",
  overview: "overview",
);

final testTvRecommendationResult = TvRecommendationResult(
  adult: true,
  backdropPath: "",
  id: 123,
  name: "",
  originalLanguage: "",
  originalName: "",
  overview: "",
  posterPath: "",
  genreIds: [123],
  popularity: 123,
  firstAirDate: "",
  voteAverage: 123,
  voteCount: 123,
  originCountry: ["US"],
);

final testTvRecommendation = TvRecomemendation(
  adult: true,
  backdropPath: "",
  id: 123,
  name: "",
  originalLanguage: "",
  originalName: "",
  overview: "",
  posterPath: "",
  genreIds: [123],
  popularity: 123,
  firstAirDate: "",
  voteAverage: 123,
  voteCount: 123,
  originCountry: ["US"],
);

final testTvWatchlist = TV.watchlist(
  id: 1,
  posterPath: "posterPath",
  overview: "overview",
  name: "title",
);

final testTvMap = {
  'id': 1,
  'title': 'title',
  'posterPath': 'posterPath',
  'overview': 'overview',
};
