import 'package:core/data/models/tv_table.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const testTvTable = TvTable(id: 1, title: "title", posterPath: "posterPath", overview: "overview");

  const tvTable = {
    'id': 1,
    'title': "title",
    'posterPath': "posterPath",
    'overview': "overview",
  };

  test('should be a subclass of Tv toJson', () async {
    final result = testTvTable.toJson();
    identical(result.toString(), tvTable.toString());
  });

  test('should be a subclass of Tv entity', () async {
    final result = testTvTable.toEntity();
    identical(result.toString(), tvTable.toString());
  });
}
