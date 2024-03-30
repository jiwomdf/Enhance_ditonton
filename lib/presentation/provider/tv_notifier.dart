import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_popular.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_popular.dart';
import 'package:flutter/foundation.dart';

class TvNotifier extends ChangeNotifier {
  final GetTvPopular getTvPopular;

  TvNotifier({required this.getTvPopular});

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<TvPopular> _tv = [];
  List<TvPopular> get tv => _tv;

  String _message = '';
  String get message => _message;

  Future<void> fetchPopularMovies() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getTvPopular.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (tvData) {
        _tv = tvData;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
