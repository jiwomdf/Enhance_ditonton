part of 'movie_top_rated_bloc.dart';

sealed class MovieTopRatedState extends Equatable {
  const MovieTopRatedState();

  @override
  List<Object> get props => [];
}

final class MovieTopRatedEmpty extends MovieTopRatedState {}

final class MovieTopRatedLoading extends MovieTopRatedState {}

class MovieTopRatedError extends MovieTopRatedState {
  final String message;
  const MovieTopRatedError(this.message);
  @override
  List<Object> get props => [message];
}

class MovieTopRatedHasData extends MovieTopRatedState {
  final List<Movie> result;
  const MovieTopRatedHasData(this.result);
  @override
  List<Object> get props => [result];
}
