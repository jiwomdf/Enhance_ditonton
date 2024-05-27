import 'package:core/presentation/bloc/movie_list/movie_list_bloc.dart';
import 'package:core/presentation/bloc/movie_popular/movie_popular_bloc.dart';
import 'package:core/presentation/bloc/movie_top_rated/movie_top_rated_bloc.dart';
import 'package:core/presentation/bloc/tv_airing_today/tv_airing_today_bloc.dart';
import 'package:core/presentation/bloc/tv_series_popular/tv_series_popular_bloc.dart';
import 'package:core/presentation/bloc/tv_top_rated/tv_top_rated_bloc.dart';
import 'package:core/styles/colors.dart';
import 'package:core/utils/sslpinning/http_ssl_pinning.dart';
import 'package:core/utils/utils.dart';
import 'package:ditonton/firebase_options.dart';
import 'package:ditonton/injection.dart' as di;
import 'package:ditonton/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:movie/presentation/bloc/movie_recommendations/movie_recommendation_bloc.dart';
import 'package:movie/presentation/bloc/movie_watchlist/movie_watchlist_bloc.dart';
import 'package:movie/presentation/page/home/home_movie_page.dart';
import 'package:provider/provider.dart';
import 'package:search/presentation/bloc/movie/search_bloc.dart';
import 'package:search/presentation/bloc/tv/tv_search_bloc.dart';
import 'package:tvs/presentation/bloc/tv_detail/tv_detail_bloc.dart';
import 'package:tvs/presentation/bloc/tv_popular/tv_popular_bloc.dart';
import 'package:tvs/presentation/bloc/tv_recommendation/tv_recommendation_bloc.dart';
import 'package:tvs/presentation/bloc/tv_watch_list/tv_watchlist_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await HttpSSLPinning.init();
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
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
        BlocProvider(create: (_) => di.locator<TvDetailBloc>()),
        BlocProvider(create: (_) => di.locator<TvWatchlistBloc>()),
        BlocProvider(create: (_) => di.locator<TvTopRatedBloc>()),
        BlocProvider(create: (_) => di.locator<TvPopularBloc>()),
        BlocProvider(create: (_) => di.locator<TvRecommendationBloc>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
            colorScheme: kColorScheme,
            primaryColor: kRichBlack,
            scaffoldBackgroundColor: kRichBlack),
        home: HomeMoviePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) => router(settings),
      ),
    );
  }
}
