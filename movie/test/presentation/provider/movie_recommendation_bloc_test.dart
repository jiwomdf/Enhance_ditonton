import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/presentation/bloc/movie_recommendations/movie_recommendation_bloc.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helper/test_helper_movie.mocks.dart';

void main() {
  late MovieRecommendationBloc movieRecommendationBloc;

  late MockGetMovieRecommendations mockGetMovieRecommendations;

  const testId = 0;

  setUp(() {
    mockGetMovieRecommendations = MockGetMovieRecommendations();

    movieRecommendationBloc =
        MovieRecommendationBloc(mockGetMovieRecommendations);
  });

  group('Get Movie Recommendation', () {
    blocTest<MovieRecommendationBloc, MovieRecommendationState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetMovieRecommendations.execute(testId))
            .thenAnswer((_) async => Right(testMovieList));
        return movieRecommendationBloc;
      },
      act: (bloc) => bloc.add(GetMovieRecommendationEvent(testId)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        MovieRecommendationLoading(),
        MovieRecommendationHasData(testMovieList),
      ],
      verify: (bloc) {
        verify(mockGetMovieRecommendations.execute(testId));
      },
    );

    blocTest<MovieRecommendationBloc, MovieRecommendationState>(
      'Should emit [Loading, Error] when data is gotten successfully',
      build: () {
        when(mockGetMovieRecommendations.execute(testId))
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return movieRecommendationBloc;
      },
      act: (bloc) => bloc.add(GetMovieRecommendationEvent(testId)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        MovieRecommendationLoading(),
        MovieRecommendationError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockGetMovieRecommendations.execute(testId));
      },
    );
  });
}
