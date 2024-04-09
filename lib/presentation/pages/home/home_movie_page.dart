import 'package:core/presentation/pages/about_page.dart';
import 'package:core/presentation/pages/home/tv_list_popular_widget.dart';
import 'package:core/presentation/pages/sublist_page/airing_today_tv_page.dart';
import 'package:core/presentation/pages/sublist_page/popular_movies_page.dart';
import 'package:core/presentation/pages/sublist_page/popular_tv_page.dart';
import 'package:core/presentation/pages/sublist_page/top_rated_movies_page.dart';
import 'package:core/presentation/pages/sublist_page/top_rated_tv_page.dart';
import 'package:core/presentation/pages/tv_search_page.dart';
import 'package:core/presentation/pages/watchlist_movies_page.dart';
import 'package:core/presentation/pages/watchlist_tv_page.dart';
import 'package:core/presentation/provider/movie_list_notifier.dart';
import 'package:core/routes.dart';
import 'package:core/styles/text_styles.dart';
import 'package:core/utils/state_enum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'movie_list_widget.dart';

class HomeMoviePage extends StatefulWidget {
  @override
  _HomeMoviePageState createState() => _HomeMoviePageState();
}

class _HomeMoviePageState extends State<HomeMoviePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<MovieListNotifier>(context, listen: false)
        ..fetchNowPlayingMovies()
        ..fetchPopularMovies()
        ..fetchTopRatedMovies()
        ..fetchTvPopular()
        ..fetchTvTopRated()
        ..fetchTvAiringToday(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/circle-g.png'),
              ),
              accountName: Text('Ditonton'),
              accountEmail: Text('ditonton@dicoding.com'),
            ),
            ListTile(
              leading: Icon(Icons.movie),
              title: Text('Movies'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.save_alt),
              title: Text('Watchlist'),
              onTap: () {
                Navigator.pushNamed(context, WatchlistMoviesPage.routeName);
              },
            ),
            ListTile(
              leading: Icon(Icons.save_alt),
              title: Text('Watchlist Tv'),
              onTap: () {
                Navigator.pushNamed(context, WatchlistTvPage.routeName);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AboutPage.routeName);
              },
              leading: Icon(Icons.info_outline),
              title: Text('About'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Ditonton'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Now Playing', style: kHeading6),
              Consumer<MovieListNotifier>(builder: (context, data, child) {
                final state = data.nowPlayingState;
                if (state == RequestState.loading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state == RequestState.loaded) {
                  return MovieListWidget(data.nowPlayingMovies);
                } else {
                  return Text('Failed');
                }
              }),
              _buildSubHeading(
                title: 'Popular',
                onTap: () =>
                    Navigator.pushNamed(context, PopularMoviesPage.routeName),
              ),
              Consumer<MovieListNotifier>(builder: (context, data, child) {
                final state = data.popularMoviesState;
                if (state == RequestState.loading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state == RequestState.loaded) {
                  return MovieListWidget(data.popularMovies);
                } else {
                  return Text('Failed');
                }
              }),
              _buildSubHeading(
                title: 'Top Rated',
                onTap: () =>
                    Navigator.pushNamed(context, TopRatedMoviesPage.routeName),
              ),
              Consumer<MovieListNotifier>(builder: (context, data, child) {
                final state = data.topRatedMoviesState;
                if (state == RequestState.loading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state == RequestState.loaded) {
                  return MovieListWidget(data.topRatedMovies);
                } else {
                  return Text('Failed');
                }
              }),
              _buildSubHeading(
                title: 'Now Playing on TV',
                onTap: () =>
                    Navigator.pushNamed(context, AiringTodayTVPage.routeName),
              ),
              Consumer<MovieListNotifier>(builder: (context, data, child) {
                final state = data.tvAiringTodayState;
                if (state == RequestState.loading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state == RequestState.loaded) {
                  return TVList(data.tvAiringToday);
                } else {
                  return Text('Failed');
                }
              }),
              _buildSubHeading(
                title: 'TV Series Popular',
                onTap: () =>
                    Navigator.pushNamed(context, PopularTvPage.routeName),
              ),
              Consumer<MovieListNotifier>(builder: (context, data, child) {
                final state = data.tvPopularState;
                if (state == RequestState.loading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state == RequestState.loaded) {
                  return TVList(data.tvPopular);
                } else {
                  return Text('Failed');
                }
              }),
              _buildSubHeading(
                title: 'TV Series Top Rated',
                onTap: () =>
                    Navigator.pushNamed(context, TopRatedTVPage.routeName),
              ),
              Consumer<MovieListNotifier>(builder: (context, data, child) {
                final state = data.tvTopRatedState;
                if (state == RequestState.loading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state == RequestState.loaded) {
                  return TVList(data.tvTopRated);
                } else {
                  return Text('Failed');
                }
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Icon(Icons.search),
            ),
            Text('Search'),
          ],
        ),
        onPressed: () {
          _showMyDialog();
        },
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Search'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[Text('Choose what you want to search')],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Movie'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, Routes.searchPage);
              },
            ),
            TextButton(
              child: const Text('Tv Series'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, TvSearchPage.routeName);
              },
            ),
          ],
        );
      },
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}
