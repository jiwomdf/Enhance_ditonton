part of 'movie_watchlist_bloc.dart';

sealed class MovieWatchlistEvent extends Equatable {
  const MovieWatchlistEvent();

  @override
  List<Object> get props => [];
}

class GetMovieWatchlistEvent extends MovieWatchlistEvent {
  final int id;

  const GetMovieWatchlistEvent(this.id);

  @override
  List<Object> get props => [id];
}

class GetMovieWatchlistStatusEvent extends MovieWatchlistEvent {
  final int id;

  const GetMovieWatchlistStatusEvent(this.id);

  @override
  List<Object> get props => [id];
}

class RemoveMovieWatchlistEvent extends MovieWatchlistEvent {
  final MovieDetail movieDetail;

  const RemoveMovieWatchlistEvent(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}

class InsertMovieWatchlistEvent extends MovieWatchlistEvent {
  final MovieDetail movieDetail;

  const InsertMovieWatchlistEvent(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}
