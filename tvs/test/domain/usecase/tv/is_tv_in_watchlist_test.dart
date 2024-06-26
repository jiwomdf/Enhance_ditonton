import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvs/domain/usecase/tv/is_tv_in_watchlist.dart';

import '../../../../../core/test/helper/test_helper_core.mocks.dart';

void main() {
  late IsTvInWatchlist usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = IsTvInWatchlist(mockTvRepository);
  });

  test('should get isTvInWatchlist from the repository', () async {
    var returnValue = false;

    when(mockTvRepository.isTvInWatchlist(1))
        .thenAnswer((_) async => Right(returnValue));
    final result = await usecase.execute(1);

    expect(result, Right(returnValue));
  });
}
