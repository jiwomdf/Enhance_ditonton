part of 'movie_list_bloc.dart';

sealed class MovieListState extends Equatable {
  const MovieListState();

  @override
  List<Object> get props => [];
}

/* Movie List */
final class MovieListEmpty extends MovieListState {}

final class MovieListLoading extends MovieListState {}

class MovieListError extends MovieListState {
  final String message;
  const MovieListError(this.message);
  @override
  List<Object> get props => [message];
}

class MovieListHasData extends MovieListState {
  final List<Movie> result;
  const MovieListHasData(this.result);
  @override
  List<Object> get props => [result];
}
