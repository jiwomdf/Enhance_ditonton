import 'package:core/data/models/tv_list_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  const tvRecommendationModel = {
    'page': 1,
    'tvRecommendationResult': [],
    'totalPages': 1,
    'totalResults': 1,
  };

  const tvTvModel = TvModel(
      adult: false,
      backdropPath: "",
      genreIds: [],
      id: 1,
      originCountry: [],
      originalLanguage: "",
      originalName: "",
      overview: "",
      popularity: 1,
      posterPath: "",
      firstAirDate: "",
      name: "",
      voteAverage: 1,
      voteCount: 1,
  );

  test('should be a subclass of ListTvModel fromJson', () async {
    final json = {
      'page': 1,
      'results': [],
      'total_pages': 1,
      'total_results': 1,
    };
    final result = ListTvModel.fromJson(json);
    identical(result.toString(), tvRecommendationModel.toString());
  });

  test('should be a subclass of TvModel fromJson', () async {
    final json = {
      'adult': false,
      'backdrop_path': "",
      'genre_ids': [],
      'id': 1,
      'origin_country': [],
      'original_language': "",
      'original_name': "",
      'overview': "",
      'popularity': 1,
      'poster_path': "",
      'first_air_date': "",
      'name': "",
      'vote_average': 1,
      'vote_count': 1,
    };
    final result = TvModel.fromJson(json);
    identical(result.toString(), tvTvModel.toString());
  });

}
