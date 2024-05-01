

import 'package:bloc_test/bloc_test.dart';
import 'package:core/presentation/bloc/tv_top_rated/tv_top_rated_bloc.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper_tv.mocks.dart';

void main(){

  late TvTopRatedBloc tvTopRated;
  late MockGetTvTopRated mockGetTvTopRated;

  setUp(() {
    mockGetTvTopRated = MockGetTvTopRated();

    tvTopRated = TvTopRatedBloc(mockGetTvTopRated);
  });

  group('Get Tv Popular', () {
    blocTest<TvTopRatedBloc, TvTopRatedState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetTvTopRated.execute())
            .thenAnswer((_) async => Right([testTv]));
        return tvTopRated;
      },
      act: (bloc) => bloc.add(const GetTvTopRatedEvent()),
      expect: () =>
      [
        TvTopRatedLoading(),
        TvTopRatedHasData([testTv]),
      ],
      verify: (bloc) {
        verify(mockGetTvTopRated.execute());
      },
    );

    blocTest<TvTopRatedBloc, TvTopRatedState>(
      'Should emit [Loading, Error] when get data is unsuccessful',
      build: () {
        when(mockGetTvTopRated.execute()).thenAnswer(
                (_) async => const Left(ServerFailure('Server Failure')));
        return tvTopRated;
      },
      act: (bloc) => bloc.add(const GetTvTopRatedEvent()),
      expect: () =>
      [
        TvTopRatedLoading(),
        const TvTopRatedError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockGetTvTopRated.execute());
      },
    );
  });

}