import 'dart:convert';

import 'package:core/data/models/tv_airing_today_model.dart';
import 'package:core/data/models/tv_detail_model.dart';
import 'package:core/data/models/tv_popular_model.dart';
import 'package:core/data/models/tv_recommendation_dart.dart';
import 'package:core/data/models/tv_search_model.dart';
import 'package:core/data/models/tv_toprated_model.dart';
import 'package:core/utils/exception.dart';
import 'package:http/http.dart' as http;

import '../models/tv_list_model.dart';

abstract class TvRemoteDataSource {
  Future<List<TvModel>> getTvList();
  Future<TvDetailModel> getTvDetail(int id);
  Future<List<TvSearchResult>> searchTv(String query);
  Future<List<TvSeriesPopularResult>> getTvPopular();
  Future<List<TvTopRatedModelResult>> getTvTopRated();
  Future<List<TvAiringTodayModelResult>> getTvAiringToday();
  Future<List<TvRecommendationResult>> getTvRecomendation(int id);
}

class TvRemoteDataSourceImpl implements TvRemoteDataSource {
  static const apiKey = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  static const baseUrl = 'https://api.themoviedb.org/3';

  final http.Client client;

  TvRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TvModel>> getTvList() async {
    final response =
        await client.get(Uri.parse('$baseUrl/discover/tvs?$apiKey'));

    if (response.statusCode == 200) {
      return ListTvModel.fromJson(json.decode(response.body)).tvListModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TvDetailModel> getTvDetail(int id) async {
    final response = await client.get(Uri.parse('$baseUrl/tvs/$id?$apiKey'));

    if (response.statusCode == 200) {
      return TvDetailModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvSearchResult>> searchTv(String query) async {
    final response =
        await client.get(Uri.parse('$baseUrl/search/tvs?$apiKey&query=$query'));

    if (response.statusCode == 200) {
      return TvSearchModel.fromJson(json.decode(response.body))
              .tvSearchResult ??
          [];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvSeriesPopularResult>> getTvPopular() async {
    final response = await client.get(Uri.parse('$baseUrl/tvs/popular?$apiKey'));

    if (response.statusCode == 200) {
      return TvSeriesPopularModel.fromJson(json.decode(response.body))
              .tvSeriesPopularResult ??
          [];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvTopRatedModelResult>> getTvTopRated() async {
    final response =
        await client.get(Uri.parse('$baseUrl/tvs/top_rated?$apiKey'));

    if (response.statusCode == 200) {
      return TvTopRatedModel.fromJson(json.decode(response.body))
              .tvTopRatedModelResult ??
          [];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvAiringTodayModelResult>> getTvAiringToday() async {
    final response =
        await client.get(Uri.parse('$baseUrl/tvs/airing_today?$apiKey'));

    if (response.statusCode == 200) {
      return TvAiringTodayModel.fromJson(json.decode(response.body))
              .tvAiringTodayModelResult ??
          [];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvRecommendationResult>> getTvRecomendation(int id) async {
    final response =
        await client.get(Uri.parse('$baseUrl/tvs/$id/recommendations?$apiKey'));

    if (response.statusCode == 200) {
      return TvRecommendationModel.fromJson(json.decode(response.body))
              .tvRecommendationResult ??
          [];
    } else {
      throw ServerException();
    }
  }
}
