import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_airing_today.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_airing_today.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_detail.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_popular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvPopular usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetTvPopular(mockTvRepository);
  });

  test('should get getTvListPopular from the repository', () async {
    when(mockTvRepository.getTvListPopular()).thenAnswer((_) async => Right([testTv]));
    final result = await usecase.execute();
    expect(result, Right([testTv]));
  });
}
