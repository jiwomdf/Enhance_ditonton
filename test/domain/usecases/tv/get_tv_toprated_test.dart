import 'package:core/domain/usecases/tv/get_tv_toprated.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../search/test/dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper_core_movie.mocks.dart';

void main() {
  late GetTvTopRated usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetTvTopRated(mockTvRepository);
  });

  test('should get getTvListPopular from the repository', () async {
    when(mockTvRepository.getTvListTopRated())
        .thenAnswer((_) async => Right([testTv]));
    final result = await usecase.execute();
    expect(result.toString(), Right([testTv]).toString());
  });
}
