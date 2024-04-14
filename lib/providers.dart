import 'package:core/presentation/bloc/movie_list/movie_list_bloc.dart';
import 'package:core/presentation/bloc/movie_popular/movie_popular_bloc.dart';
import 'package:core/presentation/bloc/movie_top_rated/movie_top_rated_bloc.dart';
import 'package:core/presentation/bloc/popular_movies_notifier.dart';
import 'package:core/presentation/bloc/top_rated_movies_notifier.dart';
import 'package:core/presentation/bloc/tv_airing_today/tv_airing_today_bloc.dart';
import 'package:core/presentation/bloc/tv_series_popular/tv_series_popular_bloc.dart';
import 'package:core/presentation/bloc/tv_top_rated/tv_top_rated_bloc.dart';
import 'package:ditonton/injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/bloc/movie_detail_notifier.dart';
import 'package:movie/presentation/bloc/watchlist_movie_notifier.dart';
import 'package:provider/provider.dart';
import 'package:search/presentation/bloc/movie/search_bloc.dart';
import 'package:search/presentation/bloc/tv/tv_search_notifier.dart';
import 'package:tvs/presentation/bloc/tv_detail_notifier.dart';
import 'package:tvs/presentation/bloc/tv_popular_notifier.dart';
import 'package:tvs/presentation/bloc/tv_top_rated_notifier.dart';
import 'package:tvs/presentation/bloc/tv_watchlist_notifier.dart';

var listPovider = [
  ChangeNotifierProvider(create: (_) => di.locator<MovieDetailNotifier>()),
  ChangeNotifierProvider(create: (_) => di.locator<TopRatedMoviesNotifier>()),
  ChangeNotifierProvider(create: (_) => di.locator<PopularMoviesNotifier>()),
  ChangeNotifierProvider(create: (_) => di.locator<WatchlistMovieNotifier>()),
  ChangeNotifierProvider(create: (_) => di.locator<TvDetailNotifier>()),
  ChangeNotifierProvider(create: (_) => di.locator<TvWatchlistNotifier>()),
  ChangeNotifierProvider(create: (_) => di.locator<TvSearchNotifier>()),
  ChangeNotifierProvider(create: (_) => di.locator<TopRatedTvNotifier>()),
  ChangeNotifierProvider(create: (_) => di.locator<TvPopularNotifier>()),
  BlocProvider(create: (_) => di.locator<SearchBloc>()),
  BlocProvider(create: (_) => di.locator<MovieListBloc>()),
  BlocProvider(create: (_) => di.locator<MoviePopularBloc>()),
  BlocProvider(create: (_) => di.locator<MovieTopRatedBloc>()),
  BlocProvider(create: (_) => di.locator<TvAiringTodayBloc>()),
  BlocProvider(create: (_) => di.locator<TvSeriesPopularBloc>()),
  BlocProvider(create: (_) => di.locator<TvTopRatedBloc>()),
];
