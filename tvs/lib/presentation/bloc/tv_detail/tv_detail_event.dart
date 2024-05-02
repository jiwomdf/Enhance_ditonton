part of 'tv_detail_bloc.dart';

sealed class TvDetailEvent extends Equatable {
  const TvDetailEvent();

}

class GetTvDetailEvent extends TvDetailEvent {
  final int id;

  const GetTvDetailEvent(this.id);

  @override
  List<Object> get props => [id];
}
