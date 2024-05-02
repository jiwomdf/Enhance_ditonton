part of 'tv_watchlist_bloc.dart';

sealed class TvWatchlistEvent extends Equatable {
  const TvWatchlistEvent();
}

class GetTvWatchlistEvent extends TvWatchlistEvent {
  const GetTvWatchlistEvent();

  @override
  List<Object> get props => [];
}

class IsTvInWatchlistEvent extends TvWatchlistEvent {
  final int id;

  const IsTvInWatchlistEvent(this.id);

  @override
  List<Object> get props => [id];
}

class RemoveTvWatchlistEvent extends TvWatchlistEvent {
  final int id;

  const RemoveTvWatchlistEvent(this.id);

  @override
  List<Object> get props => [id];
}

class SaveTvWatchlistEvent extends TvWatchlistEvent {
  final TvDetail tvDetail;

  const SaveTvWatchlistEvent(this.tvDetail);

  @override
  List<Object> get props => [tvDetail];
}
