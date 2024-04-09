import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ditonton/data/models/tv_detail_model.dart';
import 'package:ditonton/data/repositories/tv_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../core/lib/utils/exception.dart';
import '../../../core/lib/utils/failure.dart';
import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper_tv.mocks.dart';

void main() {
  late TvRepositoryImpl repository;
  late MockTvRemoteDataSource mockRemoteDataSource;
  late MockTvLocalDataSource mockLocalDataSource;

  setUp(() {
    mockRemoteDataSource = MockTvRemoteDataSource();
    mockLocalDataSource = MockTvLocalDataSource();
    repository = TvRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
    );
  });

  group('On Air Today TV', () {
    test(
        'should return remote data when the call to remote data source is successful',
        () async {
      when(mockRemoteDataSource.getTvAiringToday())
          .thenAnswer((_) async => [testTvAiringTodayModelResult]);
      final result = await repository.getTvListAiringToday();
      verify(mockRemoteDataSource.getTvAiringToday());
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList.toString(), [testTv].toString());
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      when(mockRemoteDataSource.getTvAiringToday())
          .thenThrow(ServerException());
      final result = await repository.getTvListAiringToday();
      verify(mockRemoteDataSource.getTvAiringToday());
      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      when(mockRemoteDataSource.getTvAiringToday())
          .thenThrow(SocketException('Failed to connect to the network'));
      final result = await repository.getTvListAiringToday();
      verify(mockRemoteDataSource.getTvAiringToday());
      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Popular TV', () {
    test('should return movie list when call to data source is success',
        () async {
      when(mockRemoteDataSource.getTvPopular())
          .thenAnswer((_) async => [testTvSeriesPopularResult]);
      final result = await repository.getTvListPopular();
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList.toString(), [testTv].toString());
    });

    test(
        'should return server failure when call to data source is unsuccessful',
        () async {
      when(mockRemoteDataSource.getTvPopular()).thenThrow(ServerException());
      final result = await repository.getTvListPopular();
      expect(result, Left(ServerFailure('')));
    });

    test(
        'should return connection failure when device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvPopular())
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getTvListPopular();
      // assert
      expect(
          result, Left(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Top Rated TV', () {
    test('should return movie list when call to data source is successful',
        () async {
      when(mockRemoteDataSource.getTvTopRated())
          .thenAnswer((_) async => [testTvTopRatedModelResult]);
      final result = await repository.getTvListTopRated();
      final resultList = result.getOrElse(() => []);
      expect(resultList.toString(), [testTv].toString());
    });

    test('should return ServerFailure when call to data source is unsuccessful',
        () async {
      when(mockRemoteDataSource.getTvTopRated()).thenThrow(ServerException());
      final result = await repository.getTvListTopRated();
      expect(result, Left(ServerFailure('')));
    });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
        () async {
      when(mockRemoteDataSource.getTvTopRated())
          .thenThrow(SocketException('Failed to connect to the network'));
      final result = await repository.getTvListTopRated();
      expect(
          result, Left(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Get TV Detail', () {
    final tId = 1;
    final testTvResponse = TvDetailModel(
      adult: false,
      backdropPath: 'backdropPath',
      budget: 100,
      homepage: "https://google.com",
      id: 1,
      imdbId: 'imdb1',
      originalLanguage: 'en',
      originalTitle: 'originalTitle',
      overview: 'overview',
      popularity: 1,
      posterPath: 'posterPath',
      releaseDate: 'releaseDate',
      revenue: 12000,
      runtime: 120,
      status: 'Status',
      tagline: 'Tagline',
      title: 'title',
      video: false,
      voteAverage: 1,
      voteCount: 1,
    );

    test(
        'should return Movie data when the call to remote data source is successful',
        () async {
      when(mockRemoteDataSource.getTvDetail(tId))
          .thenAnswer((_) async => testTvResponse);
      final result = await repository.getTvDetail(tId);
      verify(mockRemoteDataSource.getTvDetail(tId));
      expect(result.toString(), equals(Right(testTvDetail).toString()));
    });

    test(
        'should return Server Failure when the call to remote data source is unsuccessful',
        () async {
      when(mockRemoteDataSource.getTvDetail(tId)).thenThrow(ServerException());
      final result = await repository.getTvDetail(tId);
      verify(mockRemoteDataSource.getTvDetail(tId));
      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      when(mockRemoteDataSource.getTvDetail(tId))
          .thenThrow(SocketException('Failed to connect to the network'));
      final result = await repository.getTvDetail(tId);
      verify(mockRemoteDataSource.getTvDetail(tId));
      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Seach TV', () {
    final tQuery = 'spiderman';

    test('should return movie list when call to data source is successful',
        () async {
      when(mockRemoteDataSource.searchTv(tQuery))
          .thenAnswer((_) async => [testTvSearchResult]);
      final result = await repository.searchTv(tQuery);
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList.toString(), [testTv].toString());
    });

    test('should return ServerFailure when call to data source is unsuccessful',
        () async {
      when(mockRemoteDataSource.searchTv(tQuery)).thenThrow(ServerException());
      final result = await repository.searchTv(tQuery);
      expect(result, Left(ServerFailure('')));
    });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
        () async {
      when(mockRemoteDataSource.searchTv(tQuery))
          .thenThrow(SocketException('Failed to connect to the network'));
      final result = await repository.searchTv(tQuery);
      expect(
          result, Left(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('save watchlist', () {
    test('should return success message when saving successful', () async {
      when(mockLocalDataSource.insertWatchlistTv(testTvTable))
          .thenAnswer((_) async => 'Added to Watchlist');
      final result = await repository.saveWatchlistTv(testTvDetail);
      expect(result, Right('Added to Watchlist'));
    });

    test('should return DatabaseFailure when saving unsuccessful', () async {
      when(mockLocalDataSource.insertWatchlistTv(testTvTable))
          .thenThrow(DatabaseException('Failed to add watchlist'));
      final result = await repository.saveWatchlistTv(testTvDetail);
      expect(result, Left(DatabaseFailure('Failed to add watchlist')));
    });
  });

  group('remove watchlist', () {
    test('should return success message when remove successful', () async {
      when(mockLocalDataSource.removeWatchlistTv(1))
          .thenAnswer((_) async => 'Removed from watchlist');
      final result = await repository.removeWatchlistTv(1);
      expect(result, Right('Removed from watchlist'));
    });

    test('should return DatabaseFailure when remove unsuccessful', () async {
      when(mockLocalDataSource.removeWatchlistTv(1))
          .thenThrow(DatabaseException('Failed to remove watchlist'));
      final result = await repository.removeWatchlistTv(1);
      expect(result, Left(DatabaseFailure('Failed to remove watchlist')));
    });
  });

  group('get watchlist status', () {
    test('should return watch status whether data is found', () async {
      final tId = 1;
      when(mockLocalDataSource.isTvInWatchlist(tId))
          .thenAnswer((_) async => false);
      final result = await repository.isTvInWatchlist(tId);
      expect(result, Right(false));
    });
  });

  group('get watchlist tv', () {
    test('should return list of Movies', () async {
      when(mockLocalDataSource.getWatchlistTv())
          .thenAnswer((_) async => [testTvTable]);
      final result = await repository.getWatchlistTv();
      final resultList = result.getOrElse(() => []);
      expect(resultList.toString(), [testTvWatchlist].toString());
    });
  });

  group('get Recomendation TV', () {
    var id = 1;

    test('should return movie list when call to data source is successful',
        () async {
      when(mockRemoteDataSource.getTvRecomendation(id))
          .thenAnswer((_) async => [testTvRecommendationResult]);
      final result = await repository.getTvRecomendation(id);
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList.toString(), [testTvRecommendation].toString());
    });

    test('should return movie list when call to data source is successful',
        () async {
      when(mockRemoteDataSource.getTvTopRated())
          .thenAnswer((_) async => [testTvTopRatedModelResult]);
      final result = await repository.getTvListTopRated();
      final resultList = result.getOrElse(() => []);
      expect(resultList.toString(), [testTv].toString());
    });

    test('should return ServerFailure when call to data source is unsuccessful',
        () async {
      when(mockRemoteDataSource.getTvRecomendation(id))
          .thenThrow(ServerException());
      final result = await repository.getTvRecomendation(id);
      expect(result, Left(ServerFailure('')));
    });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
        () async {
      when(mockRemoteDataSource.getTvRecomendation(id))
          .thenThrow(SocketException('Failed to connect to the network'));
      final result = await repository.getTvRecomendation(id);
      expect(
          result, Left(ConnectionFailure('Failed to connect to the network')));
    });
  });
}
