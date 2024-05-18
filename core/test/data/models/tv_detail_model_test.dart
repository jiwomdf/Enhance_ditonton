import 'dart:convert';

import 'package:core/data/models/tv_detail_model.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../test/json_reader.dart';

void main(){

  const tvGenre = Genre(
      id: 1,
      name: "test"
  );

  const tvProductionCompany = ProductionCompany(
      id: 1,
      logoPath: "",
      name: "",
      originCountry: "",
  );

  const tvProductionCountry = ProductionCountry(
      iso31661: "",
      name: "",
  );

  const tvSpokenLanguage = SpokenLanguage(
      englishName: "englishName",
      iso6391: "iso6391",
      name: "name",
  );

  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      final Map<String, dynamic> jsonMap =
      json.decode(readJson('dummy_data/tv_genre.json'));
      final result = Genre.fromJson(jsonMap);
      expect(result.toString(), tvGenre.toString());
    });

    test('should return a valid model from JSON', () async {
      final Map<String, dynamic> jsonMap =
      json.decode(readJson('dummy_data/tv_production_company.json'));
      final result = ProductionCompany.fromJson(jsonMap);
      expect(result.toString(), tvProductionCompany.toString());
    });

    test('should return a valid model from JSON', () async {
      final Map<String, dynamic> jsonMap =
      json.decode(readJson('dummy_data/tv_production_country.json'));
      final result = ProductionCountry.fromJson(jsonMap);
      expect(result.toString(), tvProductionCountry.toString());
    });

    test('should return a valid model from JSON', () async {
      final Map<String, dynamic> jsonMap =
      json.decode(readJson('dummy_data/tv_spoken_language.json'));
      final result = SpokenLanguage.fromJson(jsonMap);
      expect(result.toString(), tvSpokenLanguage.toString());
    });
  });
}