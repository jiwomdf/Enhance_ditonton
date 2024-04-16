import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:core/domain/entities/movie_detail.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/domain/usecases/movie/get_watchlist_movies.dart';
import 'package:movie/domain/usecases/movie/get_watchlist_status.dart';
import 'package:movie/domain/usecases/movie/remove_watchlist.dart';
import 'package:movie/domain/usecases/movie/save_watchlist.dart';

part 'movie_watchlist_event.dart';
part 'movie_watchlist_state.dart';

class MovieWatchlistBloc
    extends Bloc<MovieWatchlistEvent, MovieWatchlistState> {
  final GetWatchlistMovies getWatchlistMovies;
  final GetWatchListStatus getWatchListStatus;
  final SaveWatchlist saveWatchlist;
  final RemoveWatchlist removeWatchlist;

  MovieWatchlistBloc(
    this.getWatchlistMovies,
    this.getWatchListStatus,
    this.saveWatchlist,
    this.removeWatchlist,
  ) : super(MovieWatchlistLoading()) {
    on<GetMovieWatchlistEvent>((event, emit) async {
      emit(MovieWatchlistLoading());
      final result = await getWatchlistMovies.execute();

      result.fold(
        (failure) {
          emit(MovieWatchlistError(failure.message));
        },
        (data) {
          emit(MovieWatchlistHasData(data));
        },
      );
    });

    on<RemoveMovieWatchlistEvent>((event, emit) async {
      final result = await removeWatchlist.execute(event.movieDetail);

      var message = "";
      result.fold(
        (failure) {},
        (data) {
          message = data;
        },
      );

      final resultStatus =
          await getWatchListStatus.execute(event.movieDetail.id);
      emit(MovieWatchlistIsAddedWatchlist(resultStatus, message));
    });

    on<InsertMovieWatchlistEvent>((event, emit) async {
      final result = await saveWatchlist.execute(event.movieDetail);

      var message = "";
      result.fold(
        (failure) {},
        (data) {
          message = data;
        },
      );

      final resultStatus =
          await getWatchListStatus.execute(event.movieDetail.id);
      emit(MovieWatchlistIsAddedWatchlist(resultStatus, message));
    });

    on<GetMovieWatchlistStatusEvent>((event, emit) async {
      final result = await getWatchListStatus.execute(event.id);
      emit(MovieWatchlistIsAddedWatchlist(result, ""));
    });
  }
}
