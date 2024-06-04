import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv_recommendation.dart';
import 'package:equatable/equatable.dart';
import 'package:tvs/domain/usecase/tv/get_tv_recommendation.dart';

part 'tv_recommendation_event.dart';
part 'tv_recommendation_state.dart';

class TvRecommendationBloc
    extends Bloc<TvRecommendationEvent, TvRecommendationState> {
  final GetTvRecomendation getTvRecomendation;

  TvRecommendationBloc(this.getTvRecomendation)
      : super(TvRecommendationLoading()) {
    on<GetTvRecommendationEvent>((event, emit) async {
      emit(TvRecommendationLoading());
      final result = await getTvRecomendation.execute(event.id);

      result.fold(
        (failure) {
          emit(TvRecommendationError(failure.message));
        },
        (data) {
          emit(TvRecommendationHasData(data));
        },
      );
    });
  }
}
