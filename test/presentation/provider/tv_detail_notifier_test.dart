import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/provider/tv_detail_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper_tv.mocks.dart';

void main() {
  late TvDetailNotifier provider;
  late MockGetTvDetail mockGetTvDetail;
  late MockSaveTvWatchlist mockSaveTvWatchlist;
  late MockRemoveTvWatchlist mockRemoveTvWatchlist;
  late MockGetWatchListTv mockGetWatchListTv;
  late MockIsTvInWatchlist mockIsTvInWatchlist;

  setUp(() {
    mockGetTvDetail = MockGetTvDetail();
    mockSaveTvWatchlist = MockSaveTvWatchlist();
    mockRemoveTvWatchlist = MockRemoveTvWatchlist();
    mockGetWatchListTv = MockGetWatchListTv();
    mockIsTvInWatchlist = MockIsTvInWatchlist();
    provider = TvDetailNotifier(
      getTvDetail: mockGetTvDetail,
      saveTvWatchlist: mockSaveTvWatchlist,
      removeTvWatchlist: mockRemoveTvWatchlist,
      isTvInWatchlist: mockIsTvInWatchlist,
    )..addListener(() {});
  });
  
  void _arrangeUsecase() {
    when(mockGetTvDetail.execute(1))
    .thenAnswer((_) async => Right(testTvDetail));
    when(mockSaveTvWatchlist.execute(testTvDetail))
        .thenAnswer((_) async => Right("Success"));
    when(mockRemoveTvWatchlist.execute(1))
        .thenAnswer((_) async => Right("Success"));
    when(mockGetWatchListTv.execute())
        .thenAnswer((_) async => Right([testTvTable]));
    when(mockIsTvInWatchlist.execute(1))
        .thenAnswer((_) async => Right(true));
  }
  
  group('Get Movie Detail', () {
    test('should get data from the usecase', () async {
      _arrangeUsecase();
      await provider.fetchTvDetail(1);
      verify(mockGetTvDetail.execute(1));
    });

    test('should return error when data is unsuccessful', () async {
      when(mockGetTvDetail.execute(1))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      await provider.fetchTvDetail(1);
      expect(provider.state, RequestState.Error);
      expect(provider.messageTvDetail, 'Server Failure');
    });
  });

  group('Watchlist', () {
    test('should get the watchlist status', () async {
      when(mockIsTvInWatchlist.execute(1))
          .thenAnswer((_) async => Right(true));
      await provider.loadWatchlistStatus(1);
      expect(provider.isAddedToWatchlist, true);
    });

    test('should execute save watchlist when function called', () async {
      _arrangeUsecase();
      await provider.addWatchlist(testTvDetail);
      verify(mockSaveTvWatchlist.execute(testTvDetail));
      expect(provider.watchlistMessage, "Success");
    });

    test('should execute remove watchlist when function called', () async {
      _arrangeUsecase();
      await provider.removeFromWatchlist(testTvDetail);
      verify(mockRemoveTvWatchlist.execute(1));
    });

    test('should update watchlist status when add watchlist success', () async {
      _arrangeUsecase();
      await provider.addWatchlist(testTvDetail);
      verify(mockSaveTvWatchlist.execute(testTvDetail));
    });

    test('should update watchlist message when add watchlist failed', () async {
      when(mockSaveTvWatchlist.execute(testTvDetail))
          .thenAnswer((_) async => Left(DatabaseFailure('Failed')));
      when(mockIsTvInWatchlist.execute(1))
          .thenAnswer((_) async => Right(true));
      await provider.addWatchlist(testTvDetail);
      expect(provider.watchlistMessage, 'Failed');
    });
  });
}
