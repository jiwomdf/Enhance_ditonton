import 'package:core/data/models/movie_table.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const movieTable = MovieTable(id: 1, title: "title", posterPath: "posterPath", overview: "overview");

  group('toJson', () {
    test('should return a valid model from JSON', () async {
      final expectedJsonMap = {
        'id': 1,
        'title': "title",
        'posterPath': "posterPath",
        'overview': "overview",
      };
      final result = movieTable.toJson();
      expect(result.toString(), expectedJsonMap.toString());
    });
  });

}
