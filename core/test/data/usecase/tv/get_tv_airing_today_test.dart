import 'package:core/domain/usecases/tv/get_tv_airing_today.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/dummy_objects.dart';
import '../../../helper/test_helper_core.mocks.dart';

void main() {
  late GetTvAiringToday usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetTvAiringToday(mockTvRepository);
  });

  test('should get TvDetail from the repository', () async {
    // arrange
    when(mockTvRepository.getTvListAiringToday())
        .thenAnswer((_) async => Right([testTv]));
    // act
    final result = await usecase.execute();
    // assert
    expect(result.toString(), Right([testTv]).toString());
  });
}
