

import 'package:core/domain/usecases/tv/get_tv_popular.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/dummy_objects.dart';
import '../../../helper/test_helper_core.mocks.dart';

void main() {
  late GetTvPopular usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetTvPopular(mockTvRepository);
  });

  test('should get TvDetail from the repository', () async {
    // arrange
    when(mockTvRepository.getTvListPopular())
        .thenAnswer((_) async => Right([testTv]));
    // act
    final result = await usecase.execute();
    // assert
    expect(result.toString(), Right([testTv]).toString());
  });
}
