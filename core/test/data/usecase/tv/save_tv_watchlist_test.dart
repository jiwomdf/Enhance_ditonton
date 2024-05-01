import 'package:core/domain/usecases/tv/save_tv_watchlist.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/dummy_objects.dart';
import '../../../helper/test_helper_core_tv.mocks.dart';

void main() {
  late SaveTvWatchlist usecase;
  late MockTvRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockTvRepository();
    usecase = SaveTvWatchlist(mockMovieRepository);
  });

  test('should save tvs from the repository', () async {
    var message = "success";

    when(mockMovieRepository.saveWatchlistTv(testTvDetail))
        .thenAnswer((_) async => Right(message));

    final result = await usecase.execute(testTvDetail);
    expect(result, Right(message));
  });
}
