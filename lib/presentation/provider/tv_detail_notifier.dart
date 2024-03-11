import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_detail.dart';
import 'package:flutter/material.dart';

class TvDetailNotifier extends ChangeNotifier {
  final GetTvDetail getTvDetail;

  TvDetailNotifier({required this.getTvDetail});

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  TvDetail? _tvDetail = null;
  TvDetail? get tvDetail => _tvDetail;

  String _message = '';
  String get message => _message;

  Future<void> fetchTvDetail(int id) async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getTvDetail.execute(id);
    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (data) {
        _tvDetail = data;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
