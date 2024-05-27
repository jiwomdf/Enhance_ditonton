import 'package:core/data/models/tv_recommendation_dart.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const testTvRecommendationModel = TvRecommendationModel(
      page: 1,
      tvRecommendationResult: [],
      totalPages: 1,
      totalResults: 1,
  );

  const testTvRecommendationResult = TvRecommendationResult(
      adult: false,
      backdropPath: "",
      id: 1,
      name: "",
      originalLanguage: "",
      originalName: "",
      overview: "",
      posterPath: "",
      mediaType: "",
      genreIds: [1],
      popularity: 0.1,
      firstAirDate: "",
      voteAverage: 1,
      voteCount: 1,
      originCountry: [""],
  );

  const tvRecommendationModel = {
    'page': 1,
    'tvRecommendationResult': [],
    'totalPages': 1,
    'totalResults': 1,
  };

  const tvRecommendationResult = {
    'adult': false,
    'backdropPath': "",
    'id': 1,
    'name': "",
    'originalLanguage': "",
    'originalName': "",
    'overview': "",
    'posterPath': "",
    'mediaType': "",
    'genreIds': [1],
    'popularity': 0.1,
    'firstAirDate': "",
    'voteAverage': 1,
    'voteCount': 1,
    'originCountry': [""],
  };

  test('should be a subclass of testTvRecommendationModel toJson', () async {
    final result = testTvRecommendationModel.toJson();
    identical(result.toString(), tvRecommendationModel.toString());
  });

  test('should be a subclass of testTvRecommendationResult toJson', () async {
    final result = testTvRecommendationResult.toJson();
    identical(result.toString(), tvRecommendationResult.toString());
  });
}
