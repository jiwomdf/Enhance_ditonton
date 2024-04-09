import 'package:core/presentation/pages/about_page.dart';
import 'package:core/presentation/pages/detail_page/movie_detail_page.dart';
import 'package:core/presentation/pages/detail_page/tv_detail_page.dart';
import 'package:core/presentation/pages/home/home_movie_page.dart';
import 'package:core/presentation/pages/sublist_page/airing_today_tv_page.dart';
import 'package:core/presentation/pages/sublist_page/popular_movies_page.dart';
import 'package:core/presentation/pages/sublist_page/popular_tv_page.dart';
import 'package:core/presentation/pages/sublist_page/top_rated_movies_page.dart';
import 'package:core/presentation/pages/sublist_page/top_rated_tv_page.dart';
import 'package:core/presentation/pages/tv_search_page.dart';
import 'package:core/presentation/pages/watchlist_movies_page.dart';
import 'package:core/presentation/pages/watchlist_tv_page.dart';
import 'package:core/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search/presentation/pages/search_page.dart';

PageRoute router(RouteSettings settings) {
  switch (settings.name) {
    case '/home':
      return MaterialPageRoute(builder: (_) => HomeMoviePage());
    case PopularMoviesPage.routeName:
      return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
    case TopRatedMoviesPage.routeName:
      return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
    case MovieDetailPage.routeName:
      final id = settings.arguments as int;
      return MaterialPageRoute(
        builder: (_) => MovieDetailPage(id: id),
        settings: settings,
      );
    case Routes.searchPage:
      return CupertinoPageRoute(builder: (_) => SearchPage());
    case WatchlistMoviesPage.routeName:
      return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
    case AboutPage.routeName:
      return MaterialPageRoute(builder: (_) => AboutPage());
    case TvDetailPage.routeName:
      final id = settings.arguments as int;
      return MaterialPageRoute(builder: (_) => TvDetailPage(id: id));
    case WatchlistTvPage.routeName:
      return MaterialPageRoute(builder: (_) => WatchlistTvPage());
    case TopRatedTVPage.routeName:
      return MaterialPageRoute(builder: (_) => TopRatedTVPage());
    case PopularTvPage.routeName:
      return MaterialPageRoute(builder: (_) => PopularTvPage());
    case AiringTodayTVPage.routeName:
      return MaterialPageRoute(builder: (_) => AiringTodayTVPage());
    case TvSearchPage.routeName:
      return MaterialPageRoute(builder: (_) => TvSearchPage());
    default:
      return MaterialPageRoute(builder: (_) {
        return Scaffold(body: Center(child: Text('Page not found :(')));
      });
  }
}
