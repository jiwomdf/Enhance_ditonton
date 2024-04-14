import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvs/domain/usecases/tv/get_tv_list.dart';

import '../../../../search/test/dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper_core_movie.mocks.dart';

void main() {
  late GetTvList usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetTvList(mockTvRepository);
  });

  test('should get TvList from the repository', () async {
    var listTv = [testTv];

    when(mockTvRepository.getTvList()).thenAnswer((_) async => Right(listTv));
    final result = await usecase.execute();

    expect(result, Right(listTv));
  });
}
