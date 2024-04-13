import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/provider/tv_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'movie_list_notifier_test.mocks.dart';

void main() {
  late TvNotifier provider;
  late MockGetTvPopular mockGetTvPopular;

  setUp(() {
    mockGetTvPopular = MockGetTvPopular();

    provider = TvNotifier(getTvPopular: mockGetTvPopular)..addListener(() {});
  });

  void _arrangeUsecase() {
    when(mockGetTvPopular.execute()).thenAnswer((_) async => Right([testTv]));
  }

  group('Get TvPopular', () {
    test('should get data from the usecase', () async {
      _arrangeUsecase();
      await provider.fetchPopularMovies();
      verify(mockGetTvPopular.execute());
      expect(provider.state, RequestState.Loaded);
      expect(provider.tv, [testTv]);
    });

    test('should return error when data is unsuccessful', () async {
      when(mockGetTvPopular.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      await provider.fetchPopularMovies();
      expect(provider.state, RequestState.Error);
      expect(provider.message, 'Server Failure');
    });
  });
}
