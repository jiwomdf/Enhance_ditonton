part of 'tv_search_bloc.dart';

sealed class TvSearchBlocEvent extends Equatable {
  const TvSearchBlocEvent();

  @override
  List<Object> get props => [];
}

class OnTvQueryChanged extends TvSearchBlocEvent {
  final String query;

  OnTvQueryChanged(this.query);

  @override
  List<Object> get props => [query];
}
