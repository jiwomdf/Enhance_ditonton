import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/provider/tv_search_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper_tv.mocks.dart';

void main() {
  late TvSearchNotifier provider;
  late MockSearchTv mockSearchTv;
  var query = "query";

  setUp(() {
    mockSearchTv = MockSearchTv();
    provider = TvSearchNotifier(searchTv: mockSearchTv);
  });

  void _arrangeUsecase() {
    when(mockSearchTv.execute(query)).thenAnswer((_) async => Right([testTv]));
  }

  group('Get searchTv', () {
    test('should get data from the usecase', () async {
      _arrangeUsecase();
      await provider.fetchTvSearch(query);
      verify(mockSearchTv.execute(query));
      expect(provider.state, RequestState.Loaded);
      expect(provider.searchResult, [testTv]);
    });

    test('should return error when data is unsuccessful', () async {
      when(mockSearchTv.execute(query))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      await provider.fetchTvSearch(query);
      expect(provider.state, RequestState.Error);
      expect(provider.message, 'Server Failure');
    });
  });
}
