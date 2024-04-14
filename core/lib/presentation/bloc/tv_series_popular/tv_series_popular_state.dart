part of 'tv_series_popular_bloc.dart';

sealed class TvSeriesPopularState extends Equatable {
  const TvSeriesPopularState();

  @override
  List<Object> get props => [];
}

final class TvSeriesPopularEmpty extends TvSeriesPopularState {}

class TvSeriesPopularLoading extends TvSeriesPopularState {}

class TvSeriesPopularError extends TvSeriesPopularState {
  final String message;

  const TvSeriesPopularError(this.message);

  @override
  List<Object> get props => [message];
}

class TvSeriesPopularHasData extends TvSeriesPopularState {
  final List<TV> result;

  const TvSeriesPopularHasData(this.result);

  @override
  List<Object> get props => [result];
}
