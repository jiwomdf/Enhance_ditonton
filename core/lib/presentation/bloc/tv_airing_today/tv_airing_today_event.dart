part of 'tv_airing_today_bloc.dart';

sealed class TvAiringTodayEvent extends Equatable {
  const TvAiringTodayEvent();
}

class GetTvAiringTodayEvent extends TvAiringTodayEvent {
  const GetTvAiringTodayEvent();

  @override
  List<Object> get props => [];
}
