import 'package:ditonton/presentation/pages/about_page.dart';
import 'package:ditonton/presentation/pages/detail_page/movie_detail_page.dart';
import 'package:ditonton/presentation/pages/detail_page/tv_detail_page.dart';
import 'package:ditonton/presentation/pages/home/home_movie_page.dart';
import 'package:ditonton/presentation/pages/search_page.dart';
import 'package:ditonton/presentation/pages/sublist_page/popular_movies_page.dart';
import 'package:ditonton/presentation/pages/sublist_page/top_rated_movies_page.dart';
import 'package:ditonton/presentation/pages/watchlist_movies_page.dart';
import 'package:ditonton/presentation/pages/watchlist_tv_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PageRoute router(RouteSettings settings) {
  switch (settings.name) {
    case '/home':
      return MaterialPageRoute(builder: (_) => HomeMoviePage());
    case PopularMoviesPage.ROUTE_NAME:
      return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
    case TopRatedMoviesPage.ROUTE_NAME:
      return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
    case MovieDetailPage.ROUTE_NAME:
      final id = settings.arguments as int;
      return MaterialPageRoute(
        builder: (_) => MovieDetailPage(id: id),
        settings: settings,
      );
    case SearchPage.ROUTE_NAME:
      return CupertinoPageRoute(builder: (_) => SearchPage());
    case WatchlistMoviesPage.ROUTE_NAME:
      return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
    case AboutPage.ROUTE_NAME:
      return MaterialPageRoute(builder: (_) => AboutPage());
    case TvDetailPage.ROUTE_NAME:
      final id = settings.arguments as int;
      return MaterialPageRoute(builder: (_) => TvDetailPage(id: id));
    case WatchlistTvPage.ROUTE_NAME:
      return MaterialPageRoute(builder: (_) => WatchlistTvPage());
    default:
      return MaterialPageRoute(builder: (_) {
        return Scaffold(body: Center(child: Text('Page not found :(')));
      });
  }
}
