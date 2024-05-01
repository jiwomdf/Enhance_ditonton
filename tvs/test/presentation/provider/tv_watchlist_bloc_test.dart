import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvs/presentation/bloc/tv_watch_list/tv_watchlist_bloc.dart';

import '../../helpers/dummy_data/dummy_objects.dart';
import '../../helpers/test_helper_tv.mocks.dart';

void main() {
  late TvWatchlistBloc tvWatchlistBloc;
  late MockSaveTvWatchlist mockSaveTvWatchlist;
  late MockRemoveTvWatchlist mockRemoveTvWatchlist;
  late MockGetTvWatchList mockGetTvWatchList;
  late MockIsTvInWatchlist mockIsTvInWatchlist;

  final testId = 1;

  setUp(() {
    mockSaveTvWatchlist = MockSaveTvWatchlist();
    mockRemoveTvWatchlist = MockRemoveTvWatchlist();
    mockGetTvWatchList = MockGetTvWatchList();
    mockIsTvInWatchlist = MockIsTvInWatchlist();

    tvWatchlistBloc = TvWatchlistBloc(
      mockGetTvWatchList,
      mockIsTvInWatchlist,
      mockSaveTvWatchlist,
      mockRemoveTvWatchlist,
    );
  });

  group('Get Watchlist', () {
    blocTest<TvWatchlistBloc, TvWatchlistState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetTvWatchList.execute())
            .thenAnswer((_) async => Right([testTv]));
        return tvWatchlistBloc;
      },
      act: (bloc) => bloc.add(const GetTvWatchlistEvent()),
      expect: () => [
        TvWatchlistLoading(),
        TvWatchlistHasData([testTv]),
      ],
      verify: (bloc) {
        verify(mockGetTvWatchList.execute());
      },
    );

    blocTest<TvWatchlistBloc, TvWatchlistState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetTvWatchList.execute())
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return tvWatchlistBloc;
      },
      act: (bloc) => bloc.add(const GetTvWatchlistEvent()),
      expect: () => [
        TvWatchlistLoading(),
        TvWatchlistError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockGetTvWatchList.execute());
      },
    );
  });

  group('Add Watchlist', () {
    blocTest<TvWatchlistBloc, TvWatchlistState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockSaveTvWatchlist.execute(testTvDetail))
            .thenAnswer((_) async => Right(addedToWatchlistTv));
        when(mockIsTvInWatchlist.execute(testId))
            .thenAnswer((_) async => Right(true));
        return tvWatchlistBloc;
      },
      act: (bloc) => bloc.add(SaveTvWatchlistEvent(testTvDetail)),
      expect: () => [
        TvWatchlistIsAddedWatchlist(true, addedToWatchlistTv),
      ],
      verify: (bloc) {
        verify(mockSaveTvWatchlist.execute(testTvDetail));
      },
    );

    blocTest<TvWatchlistBloc, TvWatchlistState>(
      'Should emit [Loading, TvWatchlistError] when data is gotten successfully',
      build: () {
        when(mockSaveTvWatchlist.execute(testTvDetail))
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        when(mockIsTvInWatchlist.execute(testId))
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return tvWatchlistBloc;
      },
      act: (bloc) => bloc.add(SaveTvWatchlistEvent(testTvDetail)),
      expect: () => [
        TvWatchlistError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockSaveTvWatchlist.execute(testTvDetail));
      },
    );
  });

  group('Removed Watchlist', () {
    blocTest<TvWatchlistBloc, TvWatchlistState>(
      'Should emit [Loading, TvWatchlistIsAddedWatchlist] when data is gotten successfully',
      build: () {
        when(mockRemoveTvWatchlist.execute(testId))
            .thenAnswer((_) async => Right(addedToWatchlistTv));
        when(mockIsTvInWatchlist.execute(testId))
            .thenAnswer((_) async => Right(true));
        return tvWatchlistBloc;
      },
      act: (bloc) => bloc.add(RemoveTvWatchlistEvent(testId)),
      expect: () => [
        TvWatchlistIsAddedWatchlist(true, addedToWatchlistTv),
      ],
      verify: (bloc) {
        verify(mockRemoveTvWatchlist.execute(testId));
      },
    );

    blocTest<TvWatchlistBloc, TvWatchlistState>(
      'Should emit [Loading, TvWatchlistError] when data is gotten successfully',
      build: () {
        when(mockRemoveTvWatchlist.execute(testId))
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        when(mockIsTvInWatchlist.execute(testId))
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return tvWatchlistBloc;
      },
      act: (bloc) => bloc.add(RemoveTvWatchlistEvent(testId)),
      expect: () => [
        TvWatchlistError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockRemoveTvWatchlist.execute(testId));
      },
    );
  });

  group('Is In Watchlist', () {
    blocTest<TvWatchlistBloc, TvWatchlistState>(
      'Should emit [Loading, TvWatchlistIsAddedWatchlist] when data is gotten successfully',
      build: () {
        when(mockIsTvInWatchlist.execute(testId))
            .thenAnswer((_) async => Right(true));
        return tvWatchlistBloc;
      },
      act: (bloc) => bloc.add(IsTvInWatchlistEvent(testId)),
      expect: () => [
        TvWatchlistIsAddedWatchlist(true, ''),
      ],
      verify: (bloc) {
        verify(mockIsTvInWatchlist.execute(testId));
      },
    );

    blocTest<TvWatchlistBloc, TvWatchlistState>(
      'Should emit [Loading, TvWatchlistError] when data is gotten successfully',
      build: () {
        when(mockIsTvInWatchlist.execute(testId))
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return tvWatchlistBloc;
      },
      act: (bloc) => bloc.add(IsTvInWatchlistEvent(testId)),
      expect: () => [
        TvWatchlistError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockIsTvInWatchlist.execute(testId));
      },
    );
  });
}
