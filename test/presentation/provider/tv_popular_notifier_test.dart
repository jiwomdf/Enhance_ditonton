import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/provider/tv_popular_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper_tv.mocks.dart';

void main() {
  late MockGetTvPopular mockGetPopularMovies;
  late TvPopularNotifier notifier;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetPopularMovies = MockGetTvPopular();
    notifier = TvPopularNotifier(getTvPopular: mockGetPopularMovies)
      ..addListener(() {
        listenerCallCount++;
      });
  });

  test('should change state to loading when usecase is called', () async {
    // arrange
    when(mockGetPopularMovies.execute())
        .thenAnswer((_) async => Right([testTv]));
    // act
    notifier.fetchPopulartv();
    // assert
    expect(notifier.state, RequestState.Loading);
    expect(listenerCallCount, 1);
  });

  test('should change movies data when data is gotten successfully', () async {
    // arrange
    when(mockGetPopularMovies.execute())
        .thenAnswer((_) async => Right([testTv]));
    // act
    await notifier.fetchPopulartv();
    // assert
    expect(notifier.state, RequestState.Loaded);
    expect(notifier.tv, [testTv]);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetPopularMovies.execute())
        .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
    // act
    await notifier.fetchPopulartv();
    // assert
    expect(notifier.state, RequestState.Error);
    expect(notifier.message, 'Server Failure');
    expect(listenerCallCount, 2);
  });
}
