part of 'movie_popular_bloc.dart';

sealed class MoviePopularState extends Equatable {
  const MoviePopularState();

  @override
  List<Object> get props => [];
}

final class MoviePopularEmpty extends MoviePopularState {}

final class MoviePopularLoading extends MoviePopularState {}

class MoviePopularError extends MoviePopularState {
  final String message;
  const MoviePopularError(this.message);
  @override
  List<Object> get props => [message];
}

class MoviePopularHasData extends MoviePopularState {
  final List<Movie> result;
  const MoviePopularHasData(this.result);
  @override
  List<Object> get props => [result];
}
