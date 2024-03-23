import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_watchlist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetWatchListTv usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetWatchListTv(mockTvRepository);
  });

  test('should get WatchlistTv from the repository', () async {
    var listTvTable = [testTvTable];

    when(mockTvRepository.getWatchlistTv()).thenAnswer((_) async => Right(listTvTable));
    final result = await usecase.execute();

    expect(result, Right(listTvTable));
  });
}
