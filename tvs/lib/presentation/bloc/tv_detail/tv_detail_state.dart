part of 'tv_detail_bloc.dart';

sealed class TvDetailState extends Equatable {
  const TvDetailState();

  @override
  List<Object> get props => [];
}

final class TvDetailEmpty extends TvDetailState {}

final class TvDetailLoading extends TvDetailState {}

class TvDetailError extends TvDetailState {
  final String message;
  const TvDetailError(this.message);
  @override
  List<Object> get props => [message];
}

class TvDetailHasData extends TvDetailState {
  final TvDetail result;
  const TvDetailHasData(this.result);
  @override
  List<Object> get props => [result];
}
