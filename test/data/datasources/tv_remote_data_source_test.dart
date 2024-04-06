import 'dart:convert';
import 'dart:io';

import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/tv_remote_data_source.dart';
import 'package:ditonton/data/models/tv_airing_today_model.dart';
import 'package:ditonton/data/models/tv_detail_model.dart';
import 'package:ditonton/data/models/tv_popular_model.dart';
import 'package:ditonton/data/models/tv_search_model.dart';
import 'package:ditonton/data/models/tv_toprated_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';

void main() {
  const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  const BASE_URL = 'https://api.themoviedb.org/3';

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
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/airing_today?$API_KEY')))
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
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/airing_today?$API_KEY')))
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
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY')))
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
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY')))
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
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY')))
          .thenAnswer((_) async => http.Response(
                  readJson('dummy_data/tv_top_rated.json'), 200, headers: {
                HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
              }));
      final result = await dataSource.getTvTopRated();
      expect(result.toString(), tvTopRatedModelResult.toString());
    });

    test('should throw ServerException when response code is other than 200',
        () async {
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      final call = dataSource.getTvTopRated();
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get TV detail', () {
    final id = 1;
    final tvDetail = TvDetailModel.fromJson(
        json.decode(readJson('dummy_data/tv_detail.json')));

    test('should return tv detail when the response code is 200', () async {
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/${id}?$API_KEY')))
          .thenAnswer((_) async => http.Response(
                  readJson('dummy_data/tv_detail.json'), 200, headers: {
                HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
              }));
      final result = await dataSource.getTvDetail(id);
      expect(result.toString(), equals(tvDetail.toString()));
    });

    test('should throw Server Exception when the response code is 404 or other',
        () async {
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/$id?$API_KEY')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      final call = dataSource.getTvDetail(id);
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('search TV', () {
    final tvSearchResult = TvSearchModel.fromJson(
            json.decode(readJson('dummy_data/tv_search.json')))
        .tvSearchResult;
    final query = 'test';

    test('should return list of tv when response code is 200', () async {
      when(mockHttpClient
              .get(Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$query')))
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
              .get(Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$query')))
          .thenAnswer((_) async => http.Response('Not Found', 404, headers: {
                HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
              }));
      final call = dataSource.searchTv(query);
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}
