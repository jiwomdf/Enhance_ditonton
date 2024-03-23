import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

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
