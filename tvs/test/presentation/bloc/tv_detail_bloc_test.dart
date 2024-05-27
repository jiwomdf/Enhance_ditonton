import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvs/presentation/bloc/tv_detail/tv_detail_bloc.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper_tv.mocks.dart';

void main() {
  late TvDetailBloc tvDetailBloc;
  late MockGetTvDetail mockGetTvDetail;
  final int testId = 1;

  setUp(() {
    mockGetTvDetail = MockGetTvDetail();

    tvDetailBloc = TvDetailBloc(mockGetTvDetail);
  });

  group('Get Movie Detail', () {
    blocTest<TvDetailBloc, TvDetailState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetTvDetail.execute(testId))
            .thenAnswer((_) async => Right(testTvDetail));
        return tvDetailBloc;
      },
      act: (bloc) => bloc.add(const GetTvDetailEvent(1)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        TvDetailLoading(),
        TvDetailHasData(testTvDetail),
      ],
      verify: (bloc) {
        verify(mockGetTvDetail.execute(1));
        return GetTvDetailEvent(testId).props;
      },
    );

    blocTest<TvDetailBloc, TvDetailState>(
      'Should emit [Loading, Error] when get data is unsuccessful',
      build: () {
        when(mockGetTvDetail.execute(1)).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return tvDetailBloc;
      },
      act: (bloc) => bloc.add(GetTvDetailEvent(testId)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        TvDetailLoading(),
        const TvDetailError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockGetTvDetail.execute(1));
        return GetTvDetailEvent(testId).props;
      },
    );

  });
}
