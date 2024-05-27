import 'package:about/about_page.dart';
import 'package:core/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/presentation/page/home/home_movie_page.dart';
import 'package:movie/presentation/page/home/sublist_page/popular_movies_page.dart';
import 'package:movie/presentation/page/home/sublist_page/top_rated_movies_page.dart';
import 'package:movie/presentation/page/movie/detail_page/movie_detail_page.dart';
import 'package:movie/presentation/page/movie/watchlist_movies_page.dart';
import 'package:search/presentation/pages/movie/search_page.dart';
import 'package:search/presentation/pages/tv/tv_search_page.dart';
import 'package:tvs/presentation/pages/tvs/airing_today_tv_page.dart';
import 'package:tvs/presentation/pages/tvs/popular_tv_page.dart';
import 'package:tvs/presentation/pages/tvs/top_rated_tv_page.dart';
import 'package:tvs/presentation/pages/tvs/tv_detail_page.dart';
import 'package:tvs/presentation/pages/tvs/watchlist_tv_page.dart';

PageRoute router(RouteSettings settings) {
  switch (settings.name) {
    case '/home':
      return MaterialPageRoute(builder: (_) => HomeMoviePage());
    case PopularMoviesPage.routeName:
      return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
    case TopRatedMoviesPage.routeName:
      return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
    case Routes.movieDetail:
      final id = settings.arguments as int;
      return MaterialPageRoute(
        builder: (_) => MovieDetailPage(id: id),
        settings: settings,
      );
    case Routes.searchPage:
      return CupertinoPageRoute(builder: (_) => SearchPage());
    case Routes.movieWatchList:
      return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
    case Routes.aboutPage:
      return MaterialPageRoute(builder: (_) => AboutPage());
    case Routes.tvDetail:
      final id = settings.arguments as int;
      return MaterialPageRoute(builder: (_) => TvDetailPage(id: id));
    case Routes.tvWatchList:
      return MaterialPageRoute(builder: (_) => WatchlistTvPage());
    case Routes.tvTopRated:
      return MaterialPageRoute(builder: (_) => TopRatedTVPage());
    case Routes.tvPopular:
      return MaterialPageRoute(builder: (_) => PopularTvPage());
    case Routes.tvAiringToday:
      return MaterialPageRoute(builder: (_) => TvAiringTodayPage());
    case Routes.tvSearch:
      return MaterialPageRoute(builder: (_) => TvSearchPage());
    default:
      return MaterialPageRoute(builder: (_) {
        return Scaffold(body: Center(child: Text('Page not found :(')));
      });
  }
}
