import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/presentation/bloc/movie_watchlist/movie_watchlist_bloc.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helper/test_helper_movie.mocks.dart';

void main() {
  late MovieWatchlistBloc movieWatchlistBloc;

  late MockGetWatchlistMovies mockGetWatchlistMovies;
  late MockGetWatchListStatus mockGetWatchlistStatus;
  late MockSaveWatchlist mockSaveWatchlist;
  late MockRemoveWatchlist mockRemoveWatchlist;

  const testId = 0;

  setUp(() {
    mockGetWatchlistMovies = MockGetWatchlistMovies();
    mockGetWatchlistStatus = MockGetWatchListStatus();
    mockSaveWatchlist = MockSaveWatchlist();
    mockRemoveWatchlist = MockRemoveWatchlist();

    movieWatchlistBloc = MovieWatchlistBloc(
      mockGetWatchlistMovies,
      mockGetWatchlistStatus,
      mockSaveWatchlist,
      mockRemoveWatchlist,
    );
  });

  group('Get WatchList', () {
    blocTest<MovieWatchlistBloc, MovieWatchlistState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetWatchlistMovies.execute())
            .thenAnswer((_) async => Right(testMovieList));
        return movieWatchlistBloc;
      },
      act: (bloc) => bloc.add(GetMovieWatchlistEvent(testId)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        MovieWatchlistLoading(),
        MovieWatchlistHasData(testMovieList),
      ],
      verify: (bloc) {
        verify(mockGetWatchlistMovies.execute());
      },
    );

    blocTest<MovieWatchlistBloc, MovieWatchlistState>(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockGetWatchlistMovies.execute())
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return movieWatchlistBloc;
      },
      act: (bloc) => bloc.add(GetMovieWatchlistEvent(testId)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        MovieWatchlistLoading(),
        MovieWatchlistError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockGetWatchlistMovies.execute());
      },
    );
  });

  group('Remove WatchList', () {
    blocTest<MovieWatchlistBloc, MovieWatchlistState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockRemoveWatchlist.execute(testMovieDetail))
            .thenAnswer((_) async => Right(removedFromWatchlist));
        return movieWatchlistBloc;
      },
      act: (bloc) => bloc.add(GetMovieWatchlistEvent(testId)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        MovieWatchlistLoading(),
        MovieWatchlistHasData(testMovieList),
      ],
      verify: (bloc) {
        verify(mockRemoveWatchlist.execute(testMovieDetail));
      },
    );

    blocTest<MovieWatchlistBloc, MovieWatchlistState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockRemoveWatchlist.execute(testMovieDetail))
            .thenAnswer((_) async => Right(removedFromWatchlist));
        return movieWatchlistBloc;
      },
      act: (bloc) => bloc.add(RemoveMovieWatchlistEvent(testMovieDetail)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        MovieWatchlistLoading(),
        MovieWatchlistError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockRemoveWatchlist.execute(testMovieDetail));
      },
    );
  });

  group('Insert WatchList', () {
    blocTest<MovieWatchlistBloc, MovieWatchlistState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockSaveWatchlist.execute(testMovieDetail))
            .thenAnswer((_) async => Right(addedToWatchlist));
        return movieWatchlistBloc;
      },
      act: (bloc) => bloc.add(InsertMovieWatchlistEvent(testMovieDetail)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        MovieWatchlistLoading(),
        MovieWatchlistHasData(testMovieList),
      ],
      verify: (bloc) {
        verify(mockSaveWatchlist.execute(testMovieDetail));
      },
    );

    blocTest<MovieWatchlistBloc, MovieWatchlistState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockSaveWatchlist.execute(testMovieDetail))
            .thenAnswer((_) async => Right(removedFromWatchlist));
        return movieWatchlistBloc;
      },
      act: (bloc) => bloc.add(InsertMovieWatchlistEvent(testMovieDetail)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        MovieWatchlistLoading(),
        MovieWatchlistError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockRemoveWatchlist.execute(testMovieDetail));
      },
    );
  });
}
