import 'package:core/presentation/provider/tv_notifier.dart';
import 'package:core/utils/failure.dart';
import 'package:core/utils/state_enum.dart';
import 'package:dartz/dartz.dart';
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
      expect(provider.state, RequestState.loaded);
      expect(provider.tv, [testTv]);
    });

    test('should return error when data is unsuccessful', () async {
      when(mockGetTvPopular.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      await provider.fetchPopularMovies();
      expect(provider.state, RequestState.error);
      expect(provider.message, 'Server Failure');
    });
  });
}
