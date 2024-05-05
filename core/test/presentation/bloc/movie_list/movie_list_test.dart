import 'package:bloc_test/bloc_test.dart';
import 'package:core/presentation/bloc/movie_list/movie_list_bloc.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/dummy_objects.dart';
import '../../../helper/test_helper_core.mocks.dart';

void main() {
  late MovieListBloc movieListBloc;
  late MockGetNowPlayingMovies mockGetNowPlayingMovies;

  setUp(() {
    mockGetNowPlayingMovies = MockGetNowPlayingMovies();
    movieListBloc = MovieListBloc(mockGetNowPlayingMovies);
  });

  blocTest<MovieListBloc, MovieListState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Right([testMovie]));
      return movieListBloc;
    },
    act: (bloc) => bloc.add(const GetMovieListEvent()),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      MovieListLoading(),
      MovieListHasData([testMovie]),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingMovies.execute());
    },
  );

  blocTest<MovieListBloc, MovieListState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return movieListBloc;
    },
    act: (bloc) => bloc.add(const GetMovieListEvent()),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      MovieListLoading(),
      const MovieListError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingMovies.execute());
    },
  );
}
