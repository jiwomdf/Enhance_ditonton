import 'package:core/domain/entities/movie.dart';
import 'package:core/domain/usecases/movie/get_now_playing_movies.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final GetNowPlayingMovies getNowPlayingMovies;

  MovieListBloc(this.getNowPlayingMovies) : super(MovieListEmpty()) {
    on<GetMovieListEvent>((event, emit) async {
      emit(MovieListLoading());
      final result = await getNowPlayingMovies.execute();

      result.fold(
        (failure) {
          emit(MovieListError(failure.message));
        },
        (data) {
          emit(MovieListHasData(data));
        },
      );
    });
  }
}
