import 'package:ditonton/data/models/tv_list_model.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final testTvModel = TvModel(
    adult: true,
    backdropPath: "backdropPath",
    genreIds: [1],
    id: 1,
    originCountry: ["originCountry"],
    originalLanguage: "originalLanguage",
    originalName: "originalName",
    overview: "overview",
    popularity: 2.0,
    posterPath: "posterPath",
    firstAirDate: "firstAirDate",
    name: "name",
    voteAverage: 2.0,
    voteCount: 2,
  );

  final testTv = TV(
    adult: true,
    backdropPath: "backdropPath",
    genreIds: [1],
    id: 1,
    originCountry: ["originCountry"],
    originalLanguage: "originalLanguage",
    originalName: "originalName",
    overview: "overview",
    popularity: 2.0,
    posterPath: "posterPath",
    firstAirDate: "firstAirDate",
    name: "name",
    voteAverage: 2.0,
    voteCount: 2,
  );

  test('should be a subclass of Tv entity', () async {
    final result = testTvModel.toEntity();
    identical(result.toString(), testTv.toString());
  });
}
