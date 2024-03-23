import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/movie/get_movie_detail.dart';
import 'package:ditonton/domain/usecases/tv/remove_tv_watchlist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late RemoveTvWatchlist usecase;
  late MockTvRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockTvRepository();
    usecase = RemoveTvWatchlist(mockMovieRepository);
  });

  test('should remove tv from the repository', () async {
    var message = "success";

    when(mockMovieRepository.removeWatchlistTv(1))
        .thenAnswer((_) async => Right(message));

    final result = await usecase.execute(1);
    expect(result, Right(message));
  });
}
