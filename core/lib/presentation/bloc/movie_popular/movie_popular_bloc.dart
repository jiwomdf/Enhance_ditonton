import 'package:core/domain/entities/movie.dart';
import 'package:core/domain/usecases/movie/get_popular_movies.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_popular_event.dart';
part 'movie_popular_state.dart';

class MoviePopularBloc extends Bloc<MoviePopularEvent, MoviePopularState> {
  final GetPopularMovies getPopularMovies;

  MoviePopularBloc(this.getPopularMovies) : super(MoviePopularEmpty()) {
    on<MoviePopularEvent>((event, emit) async {
      emit(MoviePopularEmpty());
      final result = await getPopularMovies.execute();

      result.fold(
        (failure) {
          emit(MoviePopularError(failure.message));
        },
        (data) {
          emit(MoviePopularHasData(data));
        },
      );
    });
  }
}
