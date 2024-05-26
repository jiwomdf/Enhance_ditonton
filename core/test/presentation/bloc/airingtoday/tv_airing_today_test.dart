import 'package:bloc_test/bloc_test.dart';
import 'package:core/presentation/bloc/tv_airing_today/tv_airing_today_bloc.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/dummy_objects.dart';
import '../../../helper/test_helper_core.mocks.dart';

void main() {
  late TvAiringTodayBloc searchBloc;
  late MockGetTvAiringToday mockGetTvAiringToday;

  setUp(() {
    mockGetTvAiringToday = MockGetTvAiringToday();
    searchBloc = TvAiringTodayBloc(mockGetTvAiringToday);
  });

  blocTest<TvAiringTodayBloc, TvAiringTodayState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetTvAiringToday.execute())
          .thenAnswer((_) async => Right([testTv]));
      return searchBloc;
    },
    act: (bloc) => bloc.add(const GetTvAiringTodayEvent()),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      TvAiringTodayLoading(),
      TvAiringTodayHasData([testTv]),
    ],
    verify: (bloc) {
      verify(mockGetTvAiringToday.execute());
      return const GetTvAiringTodayEvent().props;
    },
  );

  blocTest<TvAiringTodayBloc, TvAiringTodayState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(mockGetTvAiringToday.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return searchBloc;
    },
    act: (bloc) => bloc.add(const GetTvAiringTodayEvent()),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      TvAiringTodayLoading(),
      const TvAiringTodayError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetTvAiringToday.execute());
      return const GetTvAiringTodayEvent().props;
    },
  );
}
