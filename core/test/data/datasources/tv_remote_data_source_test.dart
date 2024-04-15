import 'dart:convert';
import 'dart:io';

import 'package:core/data/datasources/tv_remote_data_source.dart';
import 'package:core/data/models/tv_airing_today_model.dart';
import 'package:core/data/models/tv_detail_model.dart';
import 'package:core/data/models/tv_popular_model.dart';
import 'package:core/data/models/tv_recommendation_dart.dart';
import 'package:core/data/models/tv_search_model.dart';
import 'package:core/data/models/tv_toprated_model.dart';
import 'package:core/utils/exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../../test/json_reader.dart';
import '../../helper/test_helper_core_tv.mocks.dart';

void main() {
  const apiKey = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  const baseUrl = 'https://api.themoviedb.org/3';

  late TvRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = TvRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('get Now Playing Tv', () {
    final tvAiringTodayList = TvAiringTodayModel.fromJson(
            json.decode(readJson('dummy_data/tv_airing_today.json')))
        .tvAiringTodayModelResult;

    test('should return list of tv model when the response code is 200',
        () async {
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/airing_today?$apiKey')))
          .thenAnswer((_) async => http.Response(
                  readJson('dummy_data/tv_airing_today.json'), 200, headers: {
                HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
              }));
      final result = await dataSource.getTvAiringToday();
      expect(result.toString(), equals(tvAiringTodayList.toString()));
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/airing_today?$apiKey')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      final call = dataSource.getTvAiringToday();
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get Popular Tv', () {
    final tvSeriesPopularResult = TvSeriesPopularModel.fromJson(
            json.decode(readJson('dummy_data/tv_popular.json')))
        .tvSeriesPopularResult;

    test('should return list of tv when response is success (200)', () async {
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/popular?$apiKey')))
          .thenAnswer((_) async => http.Response(
                  readJson('dummy_data/tv_popular.json'), 200, headers: {
                HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
              }));
      final result = await dataSource.getTvPopular();
      expect(result.toString(), tvSeriesPopularResult.toString());
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/popular?$apiKey')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      final call = dataSource.getTvPopular();
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get Top Rated Tv', () {
    final tvTopRatedModelResult = TvTopRatedModel.fromJson(
            json.decode(readJson('dummy_data/tv_top_rated.json')))
        .tvTopRatedModelResult;

    test('should return list of tv when response code is 200 ', () async {
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/top_rated?$apiKey')))
          .thenAnswer((_) async => http.Response(
                  readJson('dummy_data/tv_top_rated.json'), 200, headers: {
                HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
              }));
      final result = await dataSource.getTvTopRated();
      expect(result.toString(), tvTopRatedModelResult.toString());
    });

    test('should throw ServerException when response code is other than 200',
        () async {
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/top_rated?$apiKey')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      final call = dataSource.getTvTopRated();
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get TV detail', () {
    const id = 1;
    final tvDetail = TvDetailModel.fromJson(
        json.decode(readJson('dummy_data/tv_detail.json')));

    test('should return tv detail when the response code is 200', () async {
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/$id?$apiKey'))).thenAnswer(
          (_) async => http.Response(
                  readJson('dummy_data/tv_detail.json'), 200, headers: {
                HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
              }));
      final result = await dataSource.getTvDetail(id);
      expect(result.toString(), equals(tvDetail.toString()));
    });

    test('should throw Server Exception when the response code is 404 or other',
        () async {
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/$id?$apiKey')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      final call = dataSource.getTvDetail(id);
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('search TV', () {
    final tvSearchResult = TvSearchModel.fromJson(
            json.decode(readJson('dummy_data/tv_search.json')))
        .tvSearchResult;
    const query = 'test';

    test('should return list of tv when response code is 200', () async {
      when(mockHttpClient
              .get(Uri.parse('$baseUrl/search/tv?$apiKey&query=$query')))
          .thenAnswer((_) async => http.Response(
                  readJson('dummy_data/tv_search.json'), 200, headers: {
                HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
              }));
      final result = await dataSource.searchTv(query);
      expect(result.toString(), tvSearchResult.toString());
    });

    test('should throw ServerException when response code is other than 200',
        () async {
      when(mockHttpClient
              .get(Uri.parse('$baseUrl/search/tv?$apiKey&query=$query')))
          .thenAnswer((_) async => http.Response('Not Found', 404, headers: {
                HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
              }));
      final call = dataSource.searchTv(query);
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('recommendation TV', () {
    final testTvRecommendation = TvRecommendationModel.fromJson(
            json.decode(readJson('dummy_data/tv_recommendation.json')))
        .tvRecommendationResult;

    test('should return list of recommendation tv when response code is 200',
        () async {
      var id = 0;
      when(mockHttpClient
              .get(Uri.parse('$baseUrl/tv/$id/recommendations?$apiKey')))
          .thenAnswer((_) async => http.Response(
                  readJson('dummy_data/tv_recommendation.json'), 200, headers: {
                HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
              }));
      final result = await dataSource.getTvRecomendation(id);
      expect(result.toString(), testTvRecommendation.toString());
    });

    test('should throw ServerException when response code is other than 200',
        () async {
      var id = 0;
      when(mockHttpClient
              .get(Uri.parse('$baseUrl/tv/$id/recommendations?$apiKey')))
          .thenAnswer((_) async => http.Response('Not Found', 404, headers: {
                HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
              }));
      final call = dataSource.getTvRecomendation(id);
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}
