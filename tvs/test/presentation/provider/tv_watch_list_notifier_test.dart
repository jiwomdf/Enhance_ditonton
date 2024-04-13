import 'package:core/utils/failure.dart';
import 'package:core/utils/state_enum.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvs/presentation/bloc/tv_watchlist_notifier.dart';

import '../../../../test/dummy_data/dummy_objects.dart';
import '../../helpers/test_helper_tv.mocks.dart';

void main() {
  late TvWatchlistNotifier provider;
  late MockGetTvWatchList mockGetTvWatchList;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetTvWatchList = MockGetTvWatchList();
    provider = TvWatchlistNotifier(getWatchlistTv: mockGetTvWatchList)
      ..addListener(() {
        listenerCallCount += 1;
      });
  });

  test('should change movies data when data is gotten successfully', () async {
    // arrange
    when(mockGetTvWatchList.execute())
        .thenAnswer((_) async => Right([testTvWatchlist]));
    // act
    await provider.fetchWatchlistTv();
    // assert
    expect(provider.watchlistTvState, RequestState.loaded);
    expect(provider.watchlistTv, [testTvWatchlist]);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetTvWatchList.execute())
        .thenAnswer((_) async => Left(DatabaseFailure("Can't get data")));
    // act
    await provider.fetchWatchlistTv();
    // assert
    expect(provider.watchlistTvState, RequestState.error);
    expect(provider.message, "Can't get data");
    expect(listenerCallCount, 2);
  });
}
