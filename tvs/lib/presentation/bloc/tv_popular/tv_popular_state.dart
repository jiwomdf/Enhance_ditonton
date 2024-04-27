part of 'tv_popular_bloc.dart';

sealed class TvPopularState extends Equatable {
  const TvPopularState();

  @override
  List<Object> get props => [];
}

final class TvPopularLoading extends TvPopularState {}

final class TvPopularEmpty extends TvPopularState {}

class TvPopularError extends TvPopularState {
  final String message;
  const TvPopularError(this.message);
  @override
  List<Object> get props => [message];
}

class TvPopularHasData extends TvPopularState {
  final List<TV> result;
  const TvPopularHasData(this.result);
  @override
  List<Object> get props => [result];
}
