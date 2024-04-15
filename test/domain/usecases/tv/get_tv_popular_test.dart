import 'package:core/domain/usecases/tv/get_tv_popular.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/test/helper/test_helper_core_tv.mocks.dart';
import '../../../../search/test/dummy_data/dummy_objects.dart';

void main() {
  late GetTvPopular usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetTvPopular(mockTvRepository);
  });

  test('should get getTvListPopular from the repository', () async {
    when(mockTvRepository.getTvListPopular())
        .thenAnswer((_) async => Right([testTv]));
    final result = await usecase.execute();
    expect(result.toString(), Right([testTv]).toString());
  });
}
