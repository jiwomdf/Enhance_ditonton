import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvs/domain/usecase/tv/remove_tv_watchlist.dart';

import '../../../../../core/test/helper/test_helper_core.mocks.dart';

void main() {
  late RemoveTvWatchlist usecase;
  late MockTvRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockTvRepository();
    usecase = RemoveTvWatchlist(mockMovieRepository);
  });

  test('should remove tvs from the repository', () async {
    var message = "success";

    when(mockMovieRepository.removeWatchlistTv(1))
        .thenAnswer((_) async => Right(message));

    final result = await usecase.execute(1);
    expect(result, Right(message));
  });
}
