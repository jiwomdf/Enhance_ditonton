import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search/domain/usecases/tv/search_tv.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../test_helper.mocks.dart';

void main() {
  late SearchTv usecase;
  late MockTvRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockTvRepository();
    usecase = SearchTv(mockMovieRepository);
  });

  test('should save tv from the repository', () async {
    var input = "input";
    var listTv = [testTv];

    when(mockMovieRepository.searchTv(input))
        .thenAnswer((_) async => Right(listTv));

    final result = await usecase.execute(input);
    expect(result, Right(listTv));
  });
}
