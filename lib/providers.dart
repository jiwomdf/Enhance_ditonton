import 'package:core/presentation/bloc/movie_list/movie_list_bloc.dart';
import 'package:core/presentation/bloc/movie_popular/movie_popular_bloc.dart';
import 'package:core/presentation/bloc/movie_top_rated/movie_top_rated_bloc.dart';
import 'package:core/presentation/bloc/tv_airing_today/tv_airing_today_bloc.dart';
import 'package:core/presentation/bloc/tv_series_popular/tv_series_popular_bloc.dart';
import 'package:core/presentation/bloc/tv_top_rated/tv_top_rated_bloc.dart';
import 'package:ditonton/injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:movie/presentation/bloc/movie_recommendations/movie_recommendation_bloc.dart';
import 'package:movie/presentation/bloc/movie_watchlist/movie_watchlist_bloc.dart';
import 'package:provider/provider.dart';
import 'package:search/presentation/bloc/movie/search_bloc.dart';
import 'package:search/presentation/bloc/tv/tv_search_bloc.dart';
import 'package:tvs/presentation/bloc/tv_detail_notifier.dart';
import 'package:tvs/presentation/bloc/tv_popular_notifier.dart';
import 'package:tvs/presentation/bloc/tv_top_rated_notifier.dart';
import 'package:tvs/presentation/bloc/tv_watchlist_notifier.dart';

var listPovider = [
  ChangeNotifierProvider(create: (_) => di.locator<TvDetailNotifier>()),
  ChangeNotifierProvider(create: (_) => di.locator<TvWatchlistNotifier>()),
  ChangeNotifierProvider(create: (_) => di.locator<TopRatedTvNotifier>()),
  ChangeNotifierProvider(create: (_) => di.locator<TvPopularNotifier>()),
  BlocProvider(create: (_) => di.locator<SearchBloc>()),
  BlocProvider(create: (_) => di.locator<TvSearchBloc>()),
  BlocProvider(create: (_) => di.locator<MovieListBloc>()),
  BlocProvider(create: (_) => di.locator<MoviePopularBloc>()),
  BlocProvider(create: (_) => di.locator<MovieTopRatedBloc>()),
  BlocProvider(create: (_) => di.locator<MovieDetailBloc>()),
  BlocProvider(create: (_) => di.locator<MovieRecommendationBloc>()),
  BlocProvider(create: (_) => di.locator<MovieWatchlistBloc>()),
  BlocProvider(create: (_) => di.locator<TvAiringTodayBloc>()),
  BlocProvider(create: (_) => di.locator<TvSeriesPopularBloc>()),
  BlocProvider(create: (_) => di.locator<TvTopRatedBloc>()),
];
