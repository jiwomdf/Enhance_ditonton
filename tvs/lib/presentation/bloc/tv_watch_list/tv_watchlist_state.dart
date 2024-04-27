part of 'tv_watchlist_bloc.dart';

sealed class TvWatchlistState extends Equatable {
  const TvWatchlistState();

  @override
  List<Object> get props => [];
}

final class TvWatchlistLoading extends TvWatchlistState {}

final class TvWatchlistEmpty extends TvWatchlistState {}

class TvWatchlistError extends TvWatchlistState {
  final String message;
  const TvWatchlistError(this.message);
  @override
  List<Object> get props => [message];
}

class TvWatchlistHasData extends TvWatchlistState {
  final List<TV> result;
  const TvWatchlistHasData(this.result);
  @override
  List<Object> get props => [result];
}

class TvWatchlistIsAddedWatchlist extends TvWatchlistState {
  final bool isAddedToWatchlist;
  final String message;

  TvWatchlistIsAddedWatchlist(this.isAddedToWatchlist, this.message);

  @override
  List<Object> get props => [isAddedToWatchlist, message];
}
