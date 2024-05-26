import 'dart:convert';

import 'package:core/data/models/tv_search_model.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../test/json_reader.dart';

void main(){

  const tvSearch = TvSearchModel(
      page: 1,
      tvSearchResult: null,
      totalPages: null,
      totalResults: null,
  );

  const tvSearchResult = TvSearchResult(
      adult: false,
      backdropPath: "",
      genreIds: null,
      id: 1,
      originCountry: null,
      originalLanguage: "",
      originalName: "",
      overview: "",
      popularity: 1,
      posterPath: "",
      firstAirDate: "",
      name: "",
      voteAverage: 10,
      voteCount: 10,
  );

  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      final Map<String, dynamic> jsonMap =
      json.decode(readJson('dummy_data/tv_search_model.json'));
      final result = TvSearchModel.fromJson(jsonMap);
      expect(result.toString(), tvSearch.toString());
    });

    test('should return a valid model from JSON', () async {
      final Map<String, dynamic> jsonMap =
      json.decode(readJson('dummy_data/tv_search_result.json'));
      final result = TvSearchResult.fromJson(jsonMap);
      expect(result.toString(), tvSearchResult.toString());
    });
  });
}