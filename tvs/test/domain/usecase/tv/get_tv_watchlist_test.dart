import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvs/domain/usecase/tv/get_tv_watchlist.dart';

import '../../../../../core/test/helper/dummy_objects.dart';
import '../../../../../core/test/helper/test_helper_core.mocks.dart';

void main() {
  late GetTvWatchList usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetTvWatchList(mockTvRepository);
  });

  test('should get WatchlistTv from the repository', () async {
    var listTestTv = [testTv];

    when(mockTvRepository.getWatchlistTv())
        .thenAnswer((_) async => Right(listTestTv));
    final result = await usecase.execute();

    expect(result, Right(listTestTv));
  });
}
