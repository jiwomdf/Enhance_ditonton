import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvs/presentation/bloc/tv_popular/tv_popular_bloc.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper_tv.mocks.dart';

void main() {
  late TvPopularBloc tvPopularBloc;
  late MockGetTvPopular mockGetTvPopular;

  setUp(() {
    mockGetTvPopular = MockGetTvPopular();

    tvPopularBloc = TvPopularBloc(mockGetTvPopular);
  });

  group('Get Tv Popular', () {
    blocTest<TvPopularBloc, TvPopularState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetTvPopular.execute())
            .thenAnswer((_) async => Right([testTv]));
        return tvPopularBloc;
      },
      act: (bloc) => bloc.add(const GetTvPopularEvent()),
      expect: () =>
      [
        TvPopularLoading(),
        TvPopularHasData([testTv]),
      ],
      verify: (bloc) {
        verify(mockGetTvPopular.execute());
        return GetTvPopularEvent().props;
      },
    );

    blocTest<TvPopularBloc, TvPopularState>(
      'Should emit [Loading, Error] when get data is unsuccessful',
      build: () {
        when(mockGetTvPopular.execute()).thenAnswer(
                (_) async => const Left(ServerFailure('Server Failure')));
        return tvPopularBloc;
      },
      act: (bloc) => bloc.add(const GetTvPopularEvent()),
      expect: () =>
      [
        TvPopularLoading(),
        const TvPopularError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockGetTvPopular.execute());
        return GetTvPopularEvent().props;
      },
    );
  });

}
