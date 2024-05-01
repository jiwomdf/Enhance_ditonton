import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:core/domain/usecases/tv/get_tv_recommendation.dart';

import '../../../helper/dummy_objects.dart';
import '../../../helper/test_helper_core_tv.mocks.dart';


void main() {
  late GetTvRecomendation usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetTvRecomendation(mockTvRepository);
  });

  test('should get getTvListPopular from the repository', () async {
    const id = 0;
    when(mockTvRepository.getTvRecomendation(id))
        .thenAnswer((_) async => Right([testTvRecommendation]));
    final result = await usecase.execute(id);
    expect(result.toString(), Right([testTvRecommendation]).toString());
  });
}