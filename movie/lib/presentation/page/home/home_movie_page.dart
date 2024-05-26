import 'package:core/presentation/bloc/movie_list/movie_list_bloc.dart';
import 'package:core/presentation/bloc/movie_popular/movie_popular_bloc.dart';
import 'package:core/presentation/bloc/movie_top_rated/movie_top_rated_bloc.dart';
import 'package:core/presentation/bloc/tv_airing_today/tv_airing_today_bloc.dart';
import 'package:core/presentation/bloc/tv_series_popular/tv_series_popular_bloc.dart';
import 'package:core/presentation/bloc/tv_top_rated/tv_top_rated_bloc.dart';
import 'package:core/routes.dart';
import 'package:core/styles/text_styles.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'movie_list_widget.dart';
import 'sublist_page/popular_movies_page.dart';
import 'sublist_page/top_rated_movies_page.dart';
import 'tv_list_popular_widget.dart';

class HomeMoviePage extends StatefulWidget {
  const HomeMoviePage({super.key});

  @override
  _HomeMoviePageState createState() => _HomeMoviePageState();
}

class _HomeMoviePageState extends State<HomeMoviePage> {
  @override
  void initState() {
    super.initState();
    context.read<MovieListBloc>().add(const GetMovieListEvent());
    context.read<MoviePopularBloc>().add(const GetMoviePopularEvent());
    context.read<MovieTopRatedBloc>().add(const GetMovieTopRatedEvent());
    context.read<TvSeriesPopularBloc>().add(const GetTvSeriesPopularEvent());
    context.read<TvTopRatedBloc>().add(const GetTvTopRatedEvent());
    context.read<TvAiringTodayBloc>().add(const GetTvAiringTodayEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/circle-g.png'),
              ),
              accountName: Text('Ditonton'),
              accountEmail: Text('ditonton@dicoding.com'),
            ),
            ListTile(
              leading: const Icon(Icons.movie),
              title: const Text('Movies'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.save_alt),
              title: const Text('Watchlist'),
              onTap: () {
                Navigator.pushNamed(context, Routes.movieWatchList);
              },
            ),
            ListTile(
              leading: const Icon(Icons.save_alt),
              title: const Text('Watchlist Tv'),
              onTap: () {
                Navigator.pushNamed(context, Routes.tvWatchList);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, Routes.aboutPage);
              },
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Ditonton'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Now Playing', style: kHeading6),
              BlocBuilder<MovieListBloc, MovieListState>(
                  builder: (context, state) {
                if (state is MovieListLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MovieListHasData) {
                  return MovieListWidget(state.result);
                } else {
                  return const Text('Failed');
                }
              }),
              _buildSubHeading(
                title: 'Popular',
                onTap: () =>
                    Navigator.pushNamed(context, PopularMoviesPage.routeName),
              ),
              BlocBuilder<MoviePopularBloc, MoviePopularState>(
                  builder: (context, state) {
                if (state is MoviePopularLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MoviePopularHasData) {
                  return MovieListWidget(state.result);
                } else {
                  return const Text('Failed');
                }
              }),
              _buildSubHeading(
                title: 'Top Rated',
                onTap: () =>
                    Navigator.pushNamed(context, TopRatedMoviesPage.routeName),
              ),
              BlocBuilder<MovieTopRatedBloc, MovieTopRatedState>(
                  builder: (context, state) {
                if (state is MovieTopRatedLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MovieTopRatedHasData) {
                  return MovieListWidget(state.result);
                } else {
                  return const Text('Failed');
                }
              }),
              _buildSubHeading(
                title: 'Now Playing on TV',
                onTap: () => Navigator.pushNamed(context, Routes.tvAiringToday),
              ),
              BlocBuilder<TvAiringTodayBloc, TvAiringTodayState>(
                  builder: (context, state) {
                if (state is TvAiringTodayLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TvAiringTodayHasData) {
                  return TVList(state.result);
                } else {
                  return const Text('Failed');
                }
              }),
              _buildSubHeading(
                title: 'TV Series Popular',
                onTap: () => Navigator.pushNamed(context, Routes.tvPopular),
              ),
              BlocBuilder<TvTopRatedBloc, TvTopRatedState>(
                  builder: (context, state) {
                if (state is TvTopRatedLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TvTopRatedHasData) {
                  return TVList(state.result);
                } else {
                  return const Text('Failed');
                }
              }),
              _buildSubHeading(
                title: 'TV Series Top Rated',
                onTap: () => Navigator.pushNamed(context, Routes.tvTopRated),
              ),
              BlocBuilder<TvSeriesPopularBloc, TvSeriesPopularState>(
                  builder: (context, state) {
                if (state is TvSeriesPopularLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TvSeriesPopularHasData) {
                  return TVList(state.result);
                } else {
                  return const Text('Failed');
                }
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 5),
              child: Icon(Icons.search),
            ),
            Text('Search'),
          ],
        ),
        onPressed: () {
          FirebaseCrashlytics.instance.crash();
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
                Navigator.pushNamed(context, Routes.tvSearch);
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
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}
