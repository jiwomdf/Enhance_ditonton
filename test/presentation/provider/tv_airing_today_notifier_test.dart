import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/provider/airing_today_tv_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'movie_list_notifier_test.mocks.dart';

void main() {
  late AiringTodayTvNotifier provider;
  late MockGetTvAiringToday mockGetTvAiringToday;
  var query = "query";

  setUp(() {
    mockGetTvAiringToday = MockGetTvAiringToday();
    provider = AiringTodayTvNotifier(getTvAiringToday: mockGetTvAiringToday);
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
      expect(provider.state, RequestState.Loaded);
      expect(provider.tv, [testTv]);
    });

    test('should return error when data is unsuccessful', () async {
      when(mockGetTvAiringToday.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      await provider.fetchAiringTodayTv();
      expect(provider.state, RequestState.Error);
      expect(provider.message, 'Server Failure');
    });
  });
}
