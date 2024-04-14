part of 'movie_list_bloc.dart';

sealed class MovieListEvent extends Equatable {
  const MovieListEvent();

  @override
  List<Object> get props => [];
}

class GetMovieListEvent extends MovieListEvent {
  const GetMovieListEvent();

  @override
  List<Object> get props => [];
}

class TvPopularEventEvent extends MovieListEvent {
  const TvPopularEventEvent();

  @override
  List<Object> get props => [];
}
