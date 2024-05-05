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

  final int testId = 1;

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
      act: (bloc) => bloc.add(GetMovieWatchlistEvent()),
      expect: () => [
        MovieWatchlistLoading(),
        MovieWatchlistHasData(testMovieList),
      ],
      verify: (bloc) {
        verify(mockGetWatchlistMovies.execute());
        return GetMovieWatchlistEvent().props;
      },
    );

    blocTest<MovieWatchlistBloc, MovieWatchlistState>(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockGetWatchlistMovies.execute())
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return movieWatchlistBloc;
      },
      act: (bloc) => bloc.add(GetMovieWatchlistEvent()),
      expect: () => [
        MovieWatchlistLoading(),
        MovieWatchlistError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockGetWatchlistMovies.execute());
        return GetMovieWatchlistEvent().props;
      },
    );
  });

  group('Remove WatchList', () {
    blocTest<MovieWatchlistBloc, MovieWatchlistState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockRemoveWatchlist.execute(testMovieDetail))
            .thenAnswer((_) async => Right(removedFromWatchlist));
        when(mockGetWatchlistStatus.execute(testId))
            .thenAnswer((_) async => true);
        return movieWatchlistBloc;
      },
      act: (bloc) => bloc.add(RemoveMovieWatchlistEvent(testMovieDetail)),
      expect: () => [
        MovieWatchlistIsAdded(true, removedFromWatchlist),
      ],
      verify: (bloc) {
        verify(mockRemoveWatchlist.execute(testMovieDetail));
        return RemoveMovieWatchlistEvent(testMovieDetail).props;
      },
    );

    blocTest<MovieWatchlistBloc, MovieWatchlistState>(
      'Should emit [MovieWatchlistError] when data is gotten fail',
      build: () {
        when(mockRemoveWatchlist.execute(testMovieDetail))
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        when(mockGetWatchlistStatus.execute(testId))
            .thenAnswer((_) async => false);
        return movieWatchlistBloc;
      },
      act: (bloc) => bloc.add(RemoveMovieWatchlistEvent(testMovieDetail)),
      expect: () => [
        MovieWatchlistError('Server Failure'),
        MovieWatchlistIsAdded(false, ''),
      ],
      verify: (bloc) {
        verify(mockRemoveWatchlist.execute(testMovieDetail));
        return RemoveMovieWatchlistEvent(testMovieDetail).props;
      },
    );
  });

  group('Insert WatchList', () {
    blocTest<MovieWatchlistBloc, MovieWatchlistState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockSaveWatchlist.execute(testMovieDetail))
            .thenAnswer((_) async => Right(addedToWatchlist));
        when(mockGetWatchlistStatus.execute(testId))
            .thenAnswer((_) async => true);
        return movieWatchlistBloc;
      },
      act: (bloc) => bloc.add(InsertMovieWatchlistEvent(testMovieDetail)),
      expect: () => [
        MovieWatchlistIsAdded(true, addedToWatchlist),
      ],
      verify: (bloc) {
        verify(mockSaveWatchlist.execute(testMovieDetail));
        return InsertMovieWatchlistEvent(testMovieDetail).props;
      },
    );

    blocTest<MovieWatchlistBloc, MovieWatchlistState>(
      'Should emit [MovieWatchlistError] when data is gotten fail',
      build: () {
        when(mockSaveWatchlist.execute(testMovieDetail))
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        when(mockGetWatchlistStatus.execute(testId))
            .thenAnswer((_) async => false);
        return movieWatchlistBloc;
      },
      act: (bloc) => bloc.add(InsertMovieWatchlistEvent(testMovieDetail)),
      expect: () => [
        MovieWatchlistError('Server Failure'),
        MovieWatchlistIsAdded(false, ''),
      ],
      verify: (bloc) {
        verify(mockSaveWatchlist.execute(testMovieDetail));
        return InsertMovieWatchlistEvent(testMovieDetail).props;
      },
    );
  });


  group('Get WatchList Status', () {
    blocTest<MovieWatchlistBloc, MovieWatchlistState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetWatchlistStatus.execute(testId))
            .thenAnswer((_) async => true);
        return movieWatchlistBloc;
      },
      act: (bloc) => bloc.add(GetMovieWatchlistStatusEvent(testId)),
      expect: () => [
        MovieWatchlistIsAdded(true, ''),
      ],
      verify: (bloc) {
        verify(mockGetWatchlistStatus.execute(testId));
        return GetMovieWatchlistStatusEvent(testId).props;
      },
    );

    blocTest<MovieWatchlistBloc, MovieWatchlistState>(
      'Should emit [MovieWatchlistError] when data is gotten fail',
      build: () {
        when(mockGetWatchlistStatus.execute(testId))
            .thenAnswer((_) async => false);
        return movieWatchlistBloc;
      },
      act: (bloc) => bloc.add(GetMovieWatchlistStatusEvent(testId)),
      expect: () => [
        MovieWatchlistIsAdded(false, ''),
      ],
      verify: (bloc) {
        verify(mockGetWatchlistStatus.execute(testId));
        return GetMovieWatchlistStatusEvent(testId).props;
      },
    );
  });
}
