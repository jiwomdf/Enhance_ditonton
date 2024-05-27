import 'dart:convert';

import 'package:core/data/models/tv_airing_today_model.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../test/json_reader.dart';

void main() {
  const testTvAiringTodayResult = TvAiringTodayModelResult(
    adult: false,
    backdropPath: "/nHS1U0yaaWV0rbcL0MHzZxW2gCZ.jpg",
    genreIds: [10764],
    id: 101604,
    originCountry: ["AE"],
    originalLanguage: "ar",
    originalName: "قلبي اطمأن",
    overview: "A program that gives you the chance to live a social experience with a young man called \"Ghaith\". Who is roaming countries to meet people in distress and pain; to look for an opportunity to make a difference in their lives.",
    popularity: 3122.543,
    posterPath: "/3iNT3rKs8q7qDr1fWxfznimZ7JV.jpg",
    firstAirDate: "2018-05-17",
    name: "My Heart Relieved",
    voteAverage: 5.792,
    voteCount: 12
  );

  const testTvAiringToday = TvAiringTodayModel(
      page: 1,
      tvAiringTodayModelResult: [
        testTvAiringTodayResult
      ],
      totalPages: 13,
      totalResults: 255,
  );

  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      final Map<String, dynamic> jsonMap =
      json.decode(readJson('dummy_data/tv_airing_today.json'));
      final result = TvAiringTodayModel.fromJson(jsonMap);
      expect(result.toString(), testTvAiringToday.toString());
    });

    test('should return a valid model from JSON', () async {
      final Map<String, dynamic> jsonMap =
      json.decode(readJson('dummy_data/tv_airing_today_result.json'));
      final result = TvAiringTodayModelResult.fromJson(jsonMap);
      expect(result.toString(), testTvAiringTodayResult.toString());
    });
  });

  group('toJson', () {
    test('should return a valid model from JSON', () async {
      final Map<String, dynamic> jsonMap = json.decode(readJson('dummy_data/tv_airing_today.json'));
      final result = testTvAiringToday.toJson();
      expect(result.toString(), jsonMap.toString());
    });

    test('should return a valid model from JSON', () async {
      final Map<String, dynamic> jsonMap = json.decode(readJson('dummy_data/tv_airing_today_result.json'));
      final result = testTvAiringTodayResult.toJson();
      expect(jsonMap.toString(), result.toString());
    });
  });

}
