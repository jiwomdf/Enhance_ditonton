import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvs/presentation/bloc/tv_recommendation/tv_recommendation_bloc.dart';

import '../../helpers/dummy_data/dummy_objects.dart';
import '../../helpers/test_helper_tv.mocks.dart';

void main() {
  late TvRecommendationBloc tvRecommendationBloc;
  late MockGetTvRecomendation mockGetTvRecommendation;

  setUp(() {
    mockGetTvRecommendation = MockGetTvRecomendation();
    tvRecommendationBloc = TvRecommendationBloc(mockGetTvRecommendation);
  });

  group("loadRecommendation", () {
    blocTest<TvRecommendationBloc, TvRecommendationState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetTvRecommendation.execute(1))
            .thenAnswer((_) async => Right([testTvRecommendation]));
        return tvRecommendationBloc;
      },
      act: (bloc) => bloc.add(const GetTvRecommendationEvent(1)),
      expect: () => [
        TvRecommendationLoading(),
        TvRecommendationHasData([testTvRecommendation]),
      ],
      verify: (bloc) {
        verify(mockGetTvRecommendation.execute(1));
      },
    );

    blocTest<TvRecommendationBloc, TvRecommendationState>(
      'Should emit [Loading, Error] when get data is unsuccessful',
      build: () {
        when(mockGetTvRecommendation.execute(1)).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return tvRecommendationBloc;
      },
      act: (bloc) => bloc.add(const GetTvRecommendationEvent(1)),
      expect: () => [
        TvRecommendationLoading(),
        const TvRecommendationError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockGetTvRecommendation.execute(1));
      },
    );
  });
}
