part of 'tv_recommendation_bloc.dart';

sealed class TvRecommendationState extends Equatable {
  const TvRecommendationState();

  @override
  List<Object> get props => [];
}

final class TvRecommendationLoading extends TvRecommendationState {}

final class TvRecommendationEmpty extends TvRecommendationState {}

class TvRecommendationError extends TvRecommendationState {
  final String message;
  const TvRecommendationError(this.message);
  @override
  List<Object> get props => [message];
}

class TvRecommendationHasData extends TvRecommendationState {
  final List<TvRecomemendation> result;
  const TvRecommendationHasData(this.result);
  @override
  List<Object> get props => [result];
}
