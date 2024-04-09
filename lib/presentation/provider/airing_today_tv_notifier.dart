import 'package:core/domain/entities/tv.dart';
import 'package:core/domain/usecases/tv/get_tv_airing_today.dart';
import 'package:core/utils/state_enum.dart';
import 'package:flutter/foundation.dart';

class AiringTodayTvNotifier extends ChangeNotifier {
  final GetTvAiringToday getTvAiringToday;

  AiringTodayTvNotifier({required this.getTvAiringToday});

  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  List<TV> _tv = [];
  List<TV> get tv => _tv;

  String _message = '';
  String get message => _message;

  Future<void> fetchAiringTodayTv() async {
    _state = RequestState.loading;
    notifyListeners();

    final result = await getTvAiringToday.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.error;
        notifyListeners();
      },
      (data) {
        _tv = data;
        _state = RequestState.loaded;
        notifyListeners();
      },
    );
  }
}
