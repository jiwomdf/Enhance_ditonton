import 'package:core/domain/usecases/tv/get_tv_list.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/dummy_objects.dart';
import '../../../helper/test_helper_core_tv.mocks.dart';

void main() {
  late GetTvList usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetTvList(mockTvRepository);
  });

  const tId = 1;

  test('should get TvDetail from the repository', () async {
    // arrange
    when(mockTvRepository.getTvList()).thenAnswer((_) async => Right([testTv]));
    // act
    final result = await usecase.execute();
    // assert
    expect(result.toString(), Right([testTv]).toString());
  });
}
