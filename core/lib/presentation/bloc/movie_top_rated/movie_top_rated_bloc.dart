import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:core/domain/usecases/movie/get_top_rated_movies.dart';
import 'package:equatable/equatable.dart';

part 'movie_top_rated_event.dart';
part 'movie_top_rated_state.dart';

class MovieTopRatedBloc extends Bloc<MovieTopRatedEvent, MovieTopRatedState> {
  final GetTopRatedMovies getTopRatedMovies;

  MovieTopRatedBloc(this.getTopRatedMovies) : super(MovieTopRatedEmpty()) {
    on<MovieTopRatedEvent>((event, emit) async {
      emit(MovieTopRatedEmpty());
      final result = await getTopRatedMovies.execute();

      result.fold(
        (failure) {
          emit(MovieTopRatedError(failure.message));
        },
        (data) {
          emit(MovieTopRatedHasData(data));
        },
      );
    });
  }
}
