import 'package:core/utils/state_enum.dart';
import 'package:core/domain/entities/tv.dart';
import 'package:core/domain/usecases/tv/get_tv_popular.dart';
import 'package:flutter/foundation.dart';

class PopularTvNotifier extends ChangeNotifier {
  final GetTvPopular getTvPopular;

  PopularTvNotifier({required this.getTvPopular});

  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  List<TV> _tv = [];
  List<TV> get tv => _tv;

  String _message = '';
  String get message => _message;

  Future<void> fetchPopulartv() async {
    _state = RequestState.loading;
    notifyListeners();

    final result = await getTvPopular.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.error;
        notifyListeners();
      },
      (tvData) {
        _tv = tvData;
        _state = RequestState.loaded;
        notifyListeners();
      },
    );
  }
}
