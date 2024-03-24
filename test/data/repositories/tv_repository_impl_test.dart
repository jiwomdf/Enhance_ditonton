import 'package:ditonton/data/repositories/tv_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

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

  //TODO(jiwo): finish later

  // group('Now Playing Movies', () {
  //   test(
  //       'should return remote data when the call to remote data source is successful',
  //       () async {
  //     // arrange
  //     when(mockRemoteDataSource.getNowPlayingMovies())
  //         .thenAnswer((_) async => tMovieModelList);
  //     // act
  //     final result = await repository.getNowPlayingMovies();
  //     // assert
  //     verify(mockRemoteDataSource.getNowPlayingMovies());
  //     /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
  //     final resultList = result.getOrElse(() => []);
  //     expect(resultList, tMovieList);
  //   });

  //   test(
  //       'should return server failure when the call to remote data source is unsuccessful',
  //       () async {
  //     // arrange
  //     when(mockRemoteDataSource.getNowPlayingMovies())
  //         .thenThrow(ServerException());
  //     // act
  //     final result = await repository.getNowPlayingMovies();
  //     // assert
  //     verify(mockRemoteDataSource.getNowPlayingMovies());
  //     expect(result, equals(Left(ServerFailure(''))));
  //   });

  //   test(
  //       'should return connection failure when the device is not connected to internet',
  //       () async {
  //     // arrange
  //     when(mockRemoteDataSource.getNowPlayingMovies())
  //         .thenThrow(SocketException('Failed to connect to the network'));
  //     // act
  //     final result = await repository.getNowPlayingMovies();
  //     // assert
  //     verify(mockRemoteDataSource.getNowPlayingMovies());
  //     expect(result,
  //         equals(Left(ConnectionFailure('Failed to connect to the network'))));
  //   });
  // });

  // group('Popular Movies', () {
  //   test('should return movie list when call to data source is success',
  //       () async {
  //     // arrange
  //     when(mockRemoteDataSource.getPopularMovies())
  //         .thenAnswer((_) async => tMovieModelList);
  //     // act
  //     final result = await repository.getPopularMovies();
  //     // assert
  //     /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
  //     final resultList = result.getOrElse(() => []);
  //     expect(resultList, tMovieList);
  //   });

  //   test(
  //       'should return server failure when call to data source is unsuccessful',
  //       () async {
  //     // arrange
  //     when(mockRemoteDataSource.getPopularMovies())
  //         .thenThrow(ServerException());
  //     // act
  //     final result = await repository.getPopularMovies();
  //     // assert
  //     expect(result, Left(ServerFailure('')));
  //   });

  //   test(
  //       'should return connection failure when device is not connected to the internet',
  //       () async {
  //     // arrange
  //     when(mockRemoteDataSource.getPopularMovies())
  //         .thenThrow(SocketException('Failed to connect to the network'));
  //     // act
  //     final result = await repository.getPopularMovies();
  //     // assert
  //     expect(
  //         result, Left(ConnectionFailure('Failed to connect to the network')));
  //   });
  // });

  // group('Top Rated Movies', () {
  //   test('should return movie list when call to data source is successful',
  //       () async {
  //     // arrange
  //     when(mockRemoteDataSource.getTopRatedMovies())
  //         .thenAnswer((_) async => tMovieModelList);
  //     // act
  //     final result = await repository.getTopRatedMovies();
  //     // assert
  //     /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
  //     final resultList = result.getOrElse(() => []);
  //     expect(resultList, tMovieList);
  //   });

  //   test('should return ServerFailure when call to data source is unsuccessful',
  //       () async {
  //     // arrange
  //     when(mockRemoteDataSource.getTopRatedMovies())
  //         .thenThrow(ServerException());
  //     // act
  //     final result = await repository.getTopRatedMovies();
  //     // assert
  //     expect(result, Left(ServerFailure('')));
  //   });

  //   test(
  //       'should return ConnectionFailure when device is not connected to the internet',
  //       () async {
  //     // arrange
  //     when(mockRemoteDataSource.getTopRatedMovies())
  //         .thenThrow(SocketException('Failed to connect to the network'));
  //     // act
  //     final result = await repository.getTopRatedMovies();
  //     // assert
  //     expect(
  //         result, Left(ConnectionFailure('Failed to connect to the network')));
  //   });
  // });

  // group('Get Movie Detail', () {
  //   final tId = 1;
  //   final tMovieResponse = MovieDetailResponse(
  //     adult: false,
  //     backdropPath: 'backdropPath',
  //     budget: 100,
  //     homepage: "https://google.com",
  //     id: 1,
  //     imdbId: 'imdb1',
  //     originalLanguage: 'en',
  //     originalTitle: 'originalTitle',
  //     overview: 'overview',
  //     popularity: 1,
  //     posterPath: 'posterPath',
  //     releaseDate: 'releaseDate',
  //     revenue: 12000,
  //     runtime: 120,
  //     status: 'Status',
  //     tagline: 'Tagline',
  //     title: 'title',
  //     video: false,
  //     voteAverage: 1,
  //     voteCount: 1,
  //   );

  //   test(
  //       'should return Movie data when the call to remote data source is successful',
  //       () async {
  //     // arrange
  //     when(mockRemoteDataSource.getMovieDetail(tId))
  //         .thenAnswer((_) async => tMovieResponse);
  //     // act
  //     final result = await repository.getMovieDetail(tId);
  //     // assert
  //     verify(mockRemoteDataSource.getMovieDetail(tId));
  //     expect(result, equals(Right(testMovieDetail)));
  //   });

  //   test(
  //       'should return Server Failure when the call to remote data source is unsuccessful',
  //       () async {
  //     // arrange
  //     when(mockRemoteDataSource.getMovieDetail(tId))
  //         .thenThrow(ServerException());
  //     // act
  //     final result = await repository.getMovieDetail(tId);
  //     // assert
  //     verify(mockRemoteDataSource.getMovieDetail(tId));
  //     expect(result, equals(Left(ServerFailure(''))));
  //   });

  //   test(
  //       'should return connection failure when the device is not connected to internet',
  //       () async {
  //     // arrange
  //     when(mockRemoteDataSource.getMovieDetail(tId))
  //         .thenThrow(SocketException('Failed to connect to the network'));
  //     // act
  //     final result = await repository.getMovieDetail(tId);
  //     // assert
  //     verify(mockRemoteDataSource.getMovieDetail(tId));
  //     expect(result,
  //         equals(Left(ConnectionFailure('Failed to connect to the network'))));
  //   });
  // });

  // group('Get Movie Recommendations', () {
  //   final tMovieList = <MovieModel>[];
  //   final tId = 1;

  //   test('should return data (movie list) when the call is successful',
  //       () async {
  //     // arrange
  //     when(mockRemoteDataSource.getMovieRecommendations(tId))
  //         .thenAnswer((_) async => tMovieList);
  //     // act
  //     final result = await repository.getMovieRecommendations(tId);
  //     // assert
  //     verify(mockRemoteDataSource.getMovieRecommendations(tId));
  //     /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
  //     final resultList = result.getOrElse(() => []);
  //     expect(resultList, equals(tMovieList));
  //   });

  //   test(
  //       'should return server failure when call to remote data source is unsuccessful',
  //       () async {
  //     // arrange
  //     when(mockRemoteDataSource.getMovieRecommendations(tId))
  //         .thenThrow(ServerException());
  //     // act
  //     final result = await repository.getMovieRecommendations(tId);
  //     // assertbuild runner
  //     verify(mockRemoteDataSource.getMovieRecommendations(tId));
  //     expect(result, equals(Left(ServerFailure(''))));
  //   });

  //   test(
  //       'should return connection failure when the device is not connected to the internet',
  //       () async {
  //     // arrange
  //     when(mockRemoteDataSource.getMovieRecommendations(tId))
  //         .thenThrow(SocketException('Failed to connect to the network'));
  //     // act
  //     final result = await repository.getMovieRecommendations(tId);
  //     // assert
  //     verify(mockRemoteDataSource.getMovieRecommendations(tId));
  //     expect(result,
  //         equals(Left(ConnectionFailure('Failed to connect to the network'))));
  //   });
  // });

  // group('Seach Movies', () {
  //   final tQuery = 'spiderman';

  //   test('should return movie list when call to data source is successful',
  //       () async {
  //     // arrange
  //     when(mockRemoteDataSource.searchMovies(tQuery))
  //         .thenAnswer((_) async => tMovieModelList);
  //     // act
  //     final result = await repository.searchMovies(tQuery);
  //     // assert
  //     /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
  //     final resultList = result.getOrElse(() => []);
  //     expect(resultList, tMovieList);
  //   });

  //   test('should return ServerFailure when call to data source is unsuccessful',
  //       () async {
  //     // arrange
  //     when(mockRemoteDataSource.searchMovies(tQuery))
  //         .thenThrow(ServerException());
  //     // act
  //     final result = await repository.searchMovies(tQuery);
  //     // assert
  //     expect(result, Left(ServerFailure('')));
  //   });

  //   test(
  //       'should return ConnectionFailure when device is not connected to the internet',
  //       () async {
  //     // arrange
  //     when(mockRemoteDataSource.searchMovies(tQuery))
  //         .thenThrow(SocketException('Failed to connect to the network'));
  //     // act
  //     final result = await repository.searchMovies(tQuery);
  //     // assert
  //     expect(
  //         result, Left(ConnectionFailure('Failed to connect to the network')));
  //   });
  // });

  // group('save watchlist', () {
  //   test('should return success message when saving successful', () async {
  //     // arrange
  //     when(mockLocalDataSource.insertWatchlist(testMovieTable))
  //         .thenAnswer((_) async => 'Added to Watchlist');
  //     // act
  //     final result = await repository.saveWatchlist(testMovieDetail);
  //     // assert
  //     expect(result, Right('Added to Watchlist'));
  //   });

  //   test('should return DatabaseFailure when saving unsuccessful', () async {
  //     // arrange
  //     when(mockLocalDataSource.insertWatchlist(testMovieTable))
  //         .thenThrow(DatabaseException('Failed to add watchlist'));
  //     // act
  //     final result = await repository.saveWatchlist(testMovieDetail);
  //     // assert
  //     expect(result, Left(DatabaseFailure('Failed to add watchlist')));
  //   });
  // });

  // group('remove watchlist', () {
  //   test('should return success message when remove successful', () async {
  //     // arrange
  //     when(mockLocalDataSource.removeWatchlist(testMovieTable))
  //         .thenAnswer((_) async => 'Removed from watchlist');
  //     // act
  //     final result = await repository.removeWatchlist(testMovieDetail);
  //     // assert
  //     expect(result, Right('Removed from watchlist'));
  //   });

  //   test('should return DatabaseFailure when remove unsuccessful', () async {
  //     // arrange
  //     when(mockLocalDataSource.removeWatchlist(testMovieTable))
  //         .thenThrow(DatabaseException('Failed to remove watchlist'));
  //     // act
  //     final result = await repository.removeWatchlist(testMovieDetail);
  //     // assert
  //     expect(result, Left(DatabaseFailure('Failed to remove watchlist')));
  //   });
  // });

  // group('get watchlist status', () {
  //   test('should return watch status whether data is found', () async {
  //     // arrange
  //     final tId = 1;
  //     when(mockLocalDataSource.getMovieById(tId)).thenAnswer((_) async => null);
  //     // act
  //     final result = await repository.isAddedToWatchlist(tId);
  //     // assert
  //     expect(result, false);
  //   });
  // });

  // group('get watchlist movies', () {
  //   test('should return list of Movies', () async {
  //     // arrange
  //     when(mockLocalDataSource.getWatchlistMovies())
  //         .thenAnswer((_) async => [testMovieTable]);
  //     // act
  //     final result = await repository.getWatchlistMovies();
  //     // assert
  //     final resultList = result.getOrElse(() => []);
  //     expect(resultList, [testWatchlistMovie]);
  //   });
  // });
}
