part of 'movie_list_bloc.dart';

sealed class MovieListEvent extends Equatable {
  const MovieListEvent();
}

class GetMovieListEvent extends MovieListEvent {
  const GetMovieListEvent();

  @override
  List<Object> get props => [];
}