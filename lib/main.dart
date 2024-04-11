import 'package:core/presentation/pages/home/home_movie_page.dart';
import 'package:core/presentation/provider/airing_today_notifier.dart';
import 'package:core/presentation/provider/movie_detail_notifier.dart';
import 'package:core/presentation/provider/movie_list_notifier.dart';
import 'package:core/presentation/provider/popular_movies_notifier.dart';
import 'package:core/presentation/provider/popular_tv_notifier.dart';
import 'package:core/presentation/provider/top_rated_movies_notifier.dart';
import 'package:core/presentation/provider/top_rated_tv_notifier.dart';
import 'package:core/presentation/provider/tv_detail_notifier.dart';
import 'package:core/presentation/provider/tv_notifier.dart';
import 'package:core/presentation/provider/tv_search_notifier.dart';
import 'package:core/presentation/provider/watchlist_movie_notifier.dart';
import 'package:core/presentation/provider/watchlist_tv_notifier.dart';
import 'package:core/styles/colors.dart';
import 'package:core/utils/utils.dart';
import 'package:ditonton/injection.dart' as di;
import 'package:ditonton/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search/presentation/provider/movie_search_notifier.dart';

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => di.locator<MovieListNotifier>()),
        ChangeNotifierProvider(
            create: (_) => di.locator<MovieDetailNotifier>()),
        ChangeNotifierProvider(
            create: (_) => di.locator<MovieSearchNotifier>()),
        ChangeNotifierProvider(
            create: (_) => di.locator<TopRatedMoviesNotifier>()),
        ChangeNotifierProvider(
            create: (_) => di.locator<PopularMoviesNotifier>()),
        ChangeNotifierProvider(
            create: (_) => di.locator<WatchlistMovieNotifier>()),
        ChangeNotifierProvider(create: (_) => di.locator<TvDetailNotifier>()),
        ChangeNotifierProvider(
            create: (_) => di.locator<WatchlistTvNotifier>()),
        ChangeNotifierProvider(create: (_) => di.locator<TvNotifier>()),
        ChangeNotifierProvider(create: (_) => di.locator<TvSearchNotifier>()),
        ChangeNotifierProvider(create: (_) => di.locator<TopRatedTvNotifier>()),
        ChangeNotifierProvider(create: (_) => di.locator<PopularTvNotifier>()),
        ChangeNotifierProvider(
            create: (_) => di.locator<AiringTodayTvNotifier>())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
            colorScheme: kColorScheme,
            primaryColor: kRichBlack,
            scaffoldBackgroundColor: kRichBlack),
        home: HomeMoviePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          return router(settings);
        },
      ),
    );
  }
}
