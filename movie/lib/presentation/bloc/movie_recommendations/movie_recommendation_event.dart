part of 'movie_recommendation_bloc.dart';

sealed class MovieRecommendationEvent extends Equatable {
  const MovieRecommendationEvent();
}

class GetMovieRecommendationEvent extends MovieRecommendationEvent {
  final int id;

  GetMovieRecommendationEvent(this.id);

  @override
  List<Object> get props => [id];
}
