import 'package:core/presentation/provider/airing_today_notifier.dart';
import 'package:core/presentation/provider/movie_list_notifier.dart';
import 'package:core/presentation/provider/popular_movies_notifier.dart';
import 'package:core/presentation/provider/top_rated_movies_notifier.dart';
import 'package:ditonton/injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/bloc/movie_detail_notifier.dart';
import 'package:movie/presentation/bloc/watchlist_movie_notifier.dart';
import 'package:provider/provider.dart';
import 'package:search/presentation/bloc/movie/searchbloc/search_bloc.dart';
import 'package:search/presentation/bloc/tv/tv_search_notifier.dart';
import 'package:tvs/presentation/bloc/tv_detail_notifier.dart';
import 'package:tvs/presentation/bloc/tv_popular_notifier.dart';
import 'package:tvs/presentation/bloc/tv_top_rated_notifier.dart';
import 'package:tvs/presentation/bloc/tv_watchlist_notifier.dart';

var listPovider = [
  ChangeNotifierProvider(create: (_) => di.locator<MovieListNotifier>()),
  ChangeNotifierProvider(create: (_) => di.locator<MovieDetailNotifier>()),
  ChangeNotifierProvider(create: (_) => di.locator<TopRatedMoviesNotifier>()),
  ChangeNotifierProvider(create: (_) => di.locator<PopularMoviesNotifier>()),
  ChangeNotifierProvider(create: (_) => di.locator<WatchlistMovieNotifier>()),
  ChangeNotifierProvider(create: (_) => di.locator<TvDetailNotifier>()),
  ChangeNotifierProvider(create: (_) => di.locator<TvWatchlistNotifier>()),
  ChangeNotifierProvider(create: (_) => di.locator<TvSearchNotifier>()),
  ChangeNotifierProvider(create: (_) => di.locator<TopRatedTvNotifier>()),
  ChangeNotifierProvider(create: (_) => di.locator<TvPopularNotifier>()),
  ChangeNotifierProvider(create: (_) => di.locator<TvAiringTodayNotifier>()),
  BlocProvider(create: (_) => di.locator<SearchBloc>()),
];
