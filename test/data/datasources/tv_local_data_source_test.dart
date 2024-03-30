import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/tv_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late TvLocalDataSourceImpl dataSource;
  late MockDatabaseHelper mockDatabaseHelper;

  setUp(() {
    mockDatabaseHelper = MockDatabaseHelper();
    dataSource = TvLocalDataSourceImpl(databaseHelper: mockDatabaseHelper);
  });

  group('save watchlist Tv', () {
    test('should return success message when insert to database is success',
        () async {
      when(mockDatabaseHelper.insertWatchlistTv(testTvTable))
          .thenAnswer((_) async => 1);
      final result = await dataSource.insertWatchlistTv(testTvTable);
      expect(result, 'Added to WatchlistTv');
    });

    test('should throw DatabaseException when insert to database is failed',
        () async {
      when(mockDatabaseHelper.insertWatchlistTv(testTvTable))
          .thenThrow(Exception());
      final call = dataSource.insertWatchlistTv(testTvTable);
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('remove watchlist Tv', () {
    test('should return success message when remove from database is success',
        () async {
      when(mockDatabaseHelper.removeWatchlistTv(1)).thenAnswer((_) async => 1);
      final result = await dataSource.removeWatchlistTv(1);
      expect(result, 'Removed from WatchlistTv');
    });

    test('should throw DatabaseException when remove from database is failed',
        () async {
      when(mockDatabaseHelper.removeWatchlistTv(1)).thenThrow(Exception());
      final call = dataSource.removeWatchlistTv(1);
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('Get Tv Detail By Id', () {
    final tId = 1;
    test('should return Tv Detail Table when data is found', () async {
      when(mockDatabaseHelper.getWatchlistTvById(tId))
          .thenAnswer((_) async => testMovieMap);
      final result = await dataSource.getTvById(tId);
      expect(result, testTvTable);
    });

    test('should return null when data is not found', () async {
      when(mockDatabaseHelper.getWatchlistTvById(tId))
          .thenAnswer((_) async => null);
      final result = await dataSource.getTvById(tId);
      expect(result, null);
    });
  });

  group('get getWatchlistTv', () {
    test('should return list of TvTable from database', () async {
      when(mockDatabaseHelper.getWatchlistTv())
          .thenAnswer((_) async => [testTvMap]);
      final result = await dataSource.getWatchlistTv();
      expect(result, [testTvTable]);
    });
  });

  group('get IsTvInWatchlist', () {
    test('should return list of MovieTable from database', () async {
      when(mockDatabaseHelper.getWatchlistTvById(1))
          .thenAnswer((_) async => testTvMap);
      final result = await dataSource.isTvInWatchlist(1);
      expect(result, true);
    });
  });
}
