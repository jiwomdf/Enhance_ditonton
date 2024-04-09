import 'package:core/domain/usecases/movie/get_now_playing_movies.dart';
import 'package:core/domain/usecases/movie/get_popular_movies.dart';
import 'package:core/domain/usecases/movie/get_top_rated_movies.dart';
import 'package:core/domain/usecases/tv/get_tv_airing_today.dart';
import 'package:core/domain/usecases/tv/get_tv_popular.dart';
import 'package:core/domain/usecases/tv/get_tv_toprated.dart';
import 'package:core/presentation/provider/movie_list_notifier.dart';
import 'package:core/utils/failure.dart';
import 'package:core/utils/state_enum.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'movie_list_notifier_test.mocks.dart';

@GenerateMocks([
  GetNowPlayingMovies,
  GetPopularMovies,
  GetTopRatedMovies,
  GetTvPopular,
  GetTvTopRated,
  GetTvAiringToday
])
void main() {
  late MovieListNotifier provider;
  late MockGetNowPlayingMovies mockGetNowPlayingMovies;
  late MockGetPopularMovies mockGetPopularMovies;
  late MockGetTopRatedMovies mockGetTopRatedMovies;
  late MockGetTvPopular mockGetTvPopular;
  late MockGetTvTopRated mockGetTvTopRated;
  late MockGetTvAiringToday mockGetTvAiringToday;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetNowPlayingMovies = MockGetNowPlayingMovies();
    mockGetPopularMovies = MockGetPopularMovies();
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    mockGetTvPopular = MockGetTvPopular();
    mockGetTvTopRated = MockGetTvTopRated();
    mockGetTvAiringToday = MockGetTvAiringToday();

    provider = MovieListNotifier(
        getNowPlayingMovies: mockGetNowPlayingMovies,
        getPopularMovies: mockGetPopularMovies,
        getTopRatedMovies: mockGetTopRatedMovies,
        getTvPopular: mockGetTvPopular,
        getTvTopRated: mockGetTvTopRated,
        getTvAiringToday: mockGetTvAiringToday)
      ..addListener(() {
        listenerCallCount += 1;
      });
  });

  group('now playing movies', () {
    test('initialState should be Empty', () {
      expect(provider.nowPlayingState, equals(RequestState.empty));
    });

    test('should get data from the usecase', () async {
      // arrange
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Right(testMovieList));
      // act
      provider.fetchNowPlayingMovies();
      // assert
      verify(mockGetNowPlayingMovies.execute());
    });

    test('should change state to Loading when usecase is called', () {
      // arrange
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Right(testMovieList));
      // act
      provider.fetchNowPlayingMovies();
      // assert
      expect(provider.nowPlayingState, RequestState.loading);
    });

    test('should change movies when data is gotten successfully', () async {
      // arrange
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Right(testMovieList));
      // act
      await provider.fetchNowPlayingMovies();
      // assert
      expect(provider.nowPlayingState, RequestState.loaded);
      expect(provider.nowPlayingMovies, testMovieList);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchNowPlayingMovies();
      // assert
      expect(provider.nowPlayingState, RequestState.error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });

  group('popular movies', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Right(testMovieList));
      // act
      provider.fetchPopularMovies();
      // assert
      expect(provider.popularMoviesState, RequestState.loading);
      // verify(provider.setState(RequestState.Loading));
    });

    test('should change movies data when data is gotten successfully',
        () async {
      // arrange
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Right(testMovieList));
      // act
      await provider.fetchPopularMovies();
      // assert
      expect(provider.popularMoviesState, RequestState.loaded);
      expect(provider.popularMovies, testMovieList);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchPopularMovies();
      // assert
      expect(provider.popularMoviesState, RequestState.error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });

  group('top rated movies', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Right(testMovieList));
      // act
      provider.fetchTopRatedMovies();
      // assert
      expect(provider.topRatedMoviesState, RequestState.loading);
    });

    test('should change movies data when data is gotten successfully',
        () async {
      // arrange
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Right(testMovieList));
      // act
      await provider.fetchTopRatedMovies();
      // assert
      expect(provider.topRatedMoviesState, RequestState.loaded);
      expect(provider.topRatedMovies, testMovieList);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchTopRatedMovies();
      // assert
      expect(provider.topRatedMoviesState, RequestState.error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });

  group('tvPopular', () {
    test('should change state to loading when usecase is called', () async {
      when(mockGetTvTopRated.execute())
          .thenAnswer((_) async => Right([testTv]));
      provider.fetchTvTopRated();
      expect(provider.tvTopRatedState, RequestState.loading);
    });

    test('should change tv data when data is gotten successfully', () async {
      when(mockGetTvPopular.execute()).thenAnswer((_) async => Right([testTv]));
      await provider.fetchTvPopular();
      expect(provider.tvPopularState, RequestState.loaded);
      expect(provider.tvPopular, [testTv]);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      when(mockGetTvPopular.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      await provider.fetchTvPopular();
      expect(provider.tvPopularState, RequestState.error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });

  group('tvTopRated', () {
    test('should change state to loading when usecase is called', () async {
      when(mockGetTvTopRated.execute())
          .thenAnswer((_) async => Right([testTv]));
      provider.fetchTvTopRated();
      expect(provider.tvTopRatedState, RequestState.loading);
    });

    test('should change tv data when data is gotten successfully', () async {
      when(mockGetTvTopRated.execute())
          .thenAnswer((_) async => Right([testTv]));
      await provider.fetchTvTopRated();
      expect(provider.tvTopRatedState, RequestState.loaded);
      expect(provider.tvTopRated, [testTv]);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      when(mockGetTvTopRated.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      await provider.fetchTvTopRated();
      expect(provider.tvTopRatedState, RequestState.error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });

  group('tvAiringToday', () {
    test('should change state to loading when usecase is called', () async {
      when(mockGetTvAiringToday.execute())
          .thenAnswer((_) async => Right([testTv]));
      provider.fetchTvAiringToday();
      expect(provider.tvAiringTodayState, RequestState.loading);
    });

    test('should change tv data when data is gotten successfully', () async {
      when(mockGetTvAiringToday.execute())
          .thenAnswer((_) async => Right([testTv]));
      await provider.fetchTvAiringToday();
      expect(provider.tvAiringTodayState, RequestState.loaded);
      expect(provider.tvAiringToday, [testTv]);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      when(mockGetTvAiringToday.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      await provider.fetchTvAiringToday();
      expect(provider.tvAiringTodayState, RequestState.error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });
}
