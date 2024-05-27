part of 'tv_popular_bloc.dart';

sealed class TvPopularEvent extends Equatable {
  const TvPopularEvent();
}

class GetTvPopularEvent extends TvPopularEvent {
  const GetTvPopularEvent();

  @override
  List<Object> get props => [];
}
