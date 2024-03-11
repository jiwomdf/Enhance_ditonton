import 'dart:convert';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/models/tv_detail_model.dart';
import 'package:http/http.dart' as http;
import '../models/tv_list_model.dart';

abstract class TvRemoteDataSource {
  Future<List<TvModel>> getTvList();
  Future<TvDetailModel> getTvDetail(int id);
}

class TvRemoteDataSourceImpl implements TvRemoteDataSource {
  static const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  static const BASE_URL = 'https://api.themoviedb.org/3';

  final http.Client client;

  TvRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TvModel>> getTvList() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/discover/tv?$API_KEY'));

    if (response.statusCode == 200) {
      return ListTvModel.fromJson(json.decode(response.body)).tvListModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TvDetailModel> getTvDetail(int id) async {
    final response = await client.get(Uri.parse('$BASE_URL/tv/$id?$API_KEY'));

    if (response.statusCode == 200) {
      return TvDetailModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
