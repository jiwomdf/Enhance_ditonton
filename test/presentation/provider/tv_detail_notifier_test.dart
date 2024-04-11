import 'package:core/presentation/provider/tv_detail_notifier.dart';
import 'package:core/utils/failure.dart';
import 'package:core/utils/state_enum.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper_tv.mocks.dart';

void main() {
  late TvDetailNotifier provider;
  late MockGetTvDetail mockGetTvDetail;
  late MockSaveTvWatchlist mockSaveTvWatchlist;
  late MockRemoveTvWatchlist mockRemoveTvWatchlist;
  late MockGetTvWatchList mockGetTvWatchList;
  late MockIsTvInWatchlist mockIsTvInWatchlist;
  late MockGetTvRecomendation mockGetTvRecomendation;

  setUp(() {
    mockGetTvDetail = MockGetTvDetail();
    mockSaveTvWatchlist = MockSaveTvWatchlist();
    mockRemoveTvWatchlist = MockRemoveTvWatchlist();
    mockGetTvWatchList = MockGetTvWatchList();
    mockIsTvInWatchlist = MockIsTvInWatchlist();
    mockGetTvRecomendation = MockGetTvRecomendation();

    provider = TvDetailNotifier(
        getTvDetail: mockGetTvDetail,
        saveTvWatchlist: mockSaveTvWatchlist,
        removeTvWatchlist: mockRemoveTvWatchlist,
        isTvInWatchlist: mockIsTvInWatchlist,
        getTvRecomendation: mockGetTvRecomendation)
      ..addListener(() {});
  });

  void _arrangeUsecase() {
    when(mockGetTvDetail.execute(1))
        .thenAnswer((_) async => Right(testTvDetail));
    when(mockSaveTvWatchlist.execute(testTvDetail))
        .thenAnswer((_) async => Right("Success"));
    when(mockRemoveTvWatchlist.execute(1))
        .thenAnswer((_) async => Right("Success"));
    when(mockGetTvWatchList.execute()).thenAnswer((_) async => Right([testTv]));
    when(mockIsTvInWatchlist.execute(1)).thenAnswer((_) async => Right(true));
    when(mockGetTvRecomendation.execute(1))
        .thenAnswer((_) async => Right([testTvRecommendation]));
  }

  group('Get Movie Detail', () {
    test('should get data from the usecase', () async {
      _arrangeUsecase();
      await provider.fetchTvDetail(1);
      verify(mockGetTvDetail.execute(1));
      expect(provider.tvDetail, testTvDetail);
    });

    test('should return error when data is unsuccessful', () async {
      when(mockGetTvDetail.execute(1))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      await provider.fetchTvDetail(1);
      expect(provider.state, RequestState.error);
      expect(provider.messageTvDetail, 'Server Failure');
    });
  });

  group('Watchlist', () {
    test('should get the watchlist status', () async {
      when(mockIsTvInWatchlist.execute(1)).thenAnswer((_) async => Right(true));
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
      when(mockIsTvInWatchlist.execute(1)).thenAnswer((_) async => Right(true));
      await provider.addWatchlist(testTvDetail);
      expect(provider.watchlistMessage, 'Failed');
    });
  });

  group("loadRecommendation", () {
    test('should loadRecommendation from the usecase', () async {
      _arrangeUsecase();
      await provider.loadRecommendation(1);
      verify(mockGetTvRecomendation.execute(1));
    });

    test('should return error when data is unsuccessful', () async {
      when(mockGetTvRecomendation.execute(1))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      await provider.loadRecommendation(1);
      expect(provider.recommendationState, RequestState.Error);
      expect(provider.tvRecomemendation, []);
    });
  });
}
