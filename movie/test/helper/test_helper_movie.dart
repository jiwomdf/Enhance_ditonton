import 'package:core/domain/repositories/movie_repository.dart';
import 'package:core/domain/usecases/movie/get_popular_movies.dart';
import 'package:core/presentation/bloc/popular_movies_notifier.dart';
import 'package:core/presentation/bloc/top_rated_movies_notifier.dart';
import 'package:mockito/annotations.dart';
import 'package:movie/domain/usecases/movie/get_movie_detail.dart';
import 'package:movie/domain/usecases/movie/get_movie_recommendations.dart';
import 'package:movie/domain/usecases/movie/get_watchlist_movies.dart';
import 'package:movie/domain/usecases/movie/get_watchlist_status.dart';
import 'package:movie/domain/usecases/movie/remove_watchlist.dart';
import 'package:movie/domain/usecases/movie/save_watchlist.dart';
import 'package:movie/presentation/bloc/movie_detail_notifier.dart';

@GenerateMocks([
  GetWatchlistMovies,
  GetMovieDetail,
  GetMovieRecommendations,
  GetWatchListStatus,
  GetPopularMovies,
  SaveWatchlist,
  RemoveWatchlist,
  MovieRepository,
  PopularMoviesNotifier,
  TopRatedMoviesNotifier,
  MovieDetailNotifier
])
void main() {}
