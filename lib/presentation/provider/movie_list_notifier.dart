import 'package:core/utils/state_enum.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/usecases/movie/get_now_playing_movies.dart';
import 'package:ditonton/domain/usecases/movie/get_popular_movies.dart';
import 'package:ditonton/domain/usecases/movie/get_top_rated_movies.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_airing_today.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_popular.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_toprated.dart';
import 'package:flutter/material.dart';

class MovieListNotifier extends ChangeNotifier {
  var _nowPlayingMovies = <Movie>[];
  List<Movie> get nowPlayingMovies => _nowPlayingMovies;

  RequestState _nowPlayingState = RequestState.Empty;
  RequestState get nowPlayingState => _nowPlayingState;

  var _popularMovies = <Movie>[];
  List<Movie> get popularMovies => _popularMovies;

  RequestState _popularMoviesState = RequestState.Empty;
  RequestState get popularMoviesState => _popularMoviesState;

  var _topRatedMovies = <Movie>[];
  List<Movie> get topRatedMovies => _topRatedMovies;

  RequestState _topRatedMoviesState = RequestState.Empty;
  RequestState get topRatedMoviesState => _topRatedMoviesState;

  var _tvList = <TV>[];
  List<TV> get tvList => _tvList;

  RequestState _tvListState = RequestState.Empty;
  RequestState get tvListState => _tvListState;

  var _tvPopular = <TV>[];
  List<TV> get tvPopular => _tvPopular;

  RequestState _tvPopularState = RequestState.Empty;
  RequestState get tvPopularState => _tvPopularState;

  var _tvTopRated = <TV>[];
  List<TV> get tvTopRated => _tvTopRated;

  RequestState _tvTopRatedState = RequestState.Empty;
  RequestState get tvTopRatedState => _tvTopRatedState;

  var _tvAiringToday = <TV>[];
  List<TV> get tvAiringToday => _tvAiringToday;

  RequestState _tvAiringTodayState = RequestState.Empty;
  RequestState get tvAiringTodayState => _tvAiringTodayState;

  String _message = '';
  String get message => _message;

  MovieListNotifier({
    required this.getNowPlayingMovies,
    required this.getPopularMovies,
    required this.getTopRatedMovies,
    required this.getTvPopular,
    required this.getTvTopRated,
    required this.getTvAiringToday,
  });

  final GetNowPlayingMovies getNowPlayingMovies;
  final GetPopularMovies getPopularMovies;
  final GetTopRatedMovies getTopRatedMovies;
  final GetTvPopular getTvPopular;
  final GetTvTopRated getTvTopRated;
  final GetTvAiringToday getTvAiringToday;

  Future<void> fetchNowPlayingMovies() async {
    _nowPlayingState = RequestState.Loading;
    notifyListeners();

    final result = await getNowPlayingMovies.execute();
    result.fold(
      (failure) {
        _nowPlayingState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (moviesData) {
        _nowPlayingState = RequestState.Loaded;
        _nowPlayingMovies = moviesData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchPopularMovies() async {
    _popularMoviesState = RequestState.Loading;
    notifyListeners();

    final result = await getPopularMovies.execute();
    result.fold(
      (failure) {
        _popularMoviesState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (moviesData) {
        _popularMoviesState = RequestState.Loaded;
        _popularMovies = moviesData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchTopRatedMovies() async {
    _topRatedMoviesState = RequestState.Loading;
    notifyListeners();

    final result = await getTopRatedMovies.execute();
    result.fold(
      (failure) {
        _topRatedMoviesState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (moviesData) {
        _topRatedMoviesState = RequestState.Loaded;
        _topRatedMovies = moviesData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchTvPopular() async {
    _tvPopularState = RequestState.Loading;
    notifyListeners();

    final result = await getTvPopular.execute();
    result.fold(
      (failure) {
        _tvPopularState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (data) {
        _tvPopularState = RequestState.Loaded;
        _tvPopular = data;
        notifyListeners();
      },
    );
  }

  Future<void> fetchTvTopRated() async {
    _tvTopRatedState = RequestState.Loading;
    notifyListeners();

    final result = await getTvTopRated.execute();
    result.fold(
      (failure) {
        _tvTopRatedState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (data) {
        _tvTopRatedState = RequestState.Loaded;
        _tvTopRated = data;
        notifyListeners();
      },
    );
  }

  Future<void> fetchTvAiringToday() async {
    _tvAiringTodayState = RequestState.Loading;
    notifyListeners();

    final result = await getTvAiringToday.execute();
    result.fold(
      (failure) {
        _tvAiringTodayState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (data) {
        _tvAiringTodayState = RequestState.Loaded;
        _tvAiringToday = data;
        notifyListeners();
      },
    );
  }
}
