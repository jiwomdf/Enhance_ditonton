import 'package:core/presentation/provider/airing_today_notifier.dart';
import 'package:core/utils/failure.dart';
import 'package:core/utils/state_enum.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'movie_list_notifier_test.mocks.dart';

void main() {
  late TvAiringTodayNotifier provider;
  late MockGetTvAiringToday mockGetTvAiringToday;

  setUp(() {
    mockGetTvAiringToday = MockGetTvAiringToday();
    provider = TvAiringTodayNotifier(getTvAiringToday: mockGetTvAiringToday);
  });

  void _arrangeUsecase() {
    when(mockGetTvAiringToday.execute())
        .thenAnswer((_) async => Right([testTv]));
  }

  group('Get GetTvAiringToday', () {
    test('should get data from the usecase', () async {
      _arrangeUsecase();
      await provider.fetchAiringTodayTv();
      verify(mockGetTvAiringToday.execute());
      expect(provider.state, RequestState.loaded);
      expect(provider.tv, [testTv]);
    });

    test('should return error when data is unsuccessful', () async {
      when(mockGetTvAiringToday.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      await provider.fetchAiringTodayTv();
      expect(provider.state, RequestState.error);
      expect(provider.message, 'Server Failure');
    });
  });
}
