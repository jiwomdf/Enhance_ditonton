part of 'tv_recommendation_bloc.dart';

sealed class TvRecommendationEvent extends Equatable {
  const TvRecommendationEvent();
}

class GetTvRecommendationEvent extends TvRecommendationEvent {
  final int id;

  const GetTvRecommendationEvent(this.id);

  @override
  List<Object> get props => [id];
}
