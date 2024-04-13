import 'package:core/domain/entities/tv.dart';
import 'package:core/domain/usecases/tv/get_tv_watchlist.dart';
import 'package:core/utils/state_enum.dart';
import 'package:flutter/foundation.dart';

class TvWatchlistNotifier extends ChangeNotifier {
  var _watchlistTv = <TV>[];
  List<TV> get watchlistTv => _watchlistTv;

  var _watchlistTvState = RequestState.empty;
  RequestState get watchlistTvState => _watchlistTvState;

  String _message = '';
  String get message => _message;

  TvWatchlistNotifier({required this.getWatchlistTv});

  final GetTvWatchList getWatchlistTv;

  Future<void> fetchWatchlistTv() async {
    _watchlistTvState = RequestState.loading;
    notifyListeners();

    final result = await getWatchlistTv.execute();
    result.fold(
      (failure) {
        _watchlistTvState = RequestState.error;
        _message = failure.message;
        notifyListeners();
      },
      (data) {
        _watchlistTvState = RequestState.loaded;
        _watchlistTv = data;
        notifyListeners();
      },
    );
  }
}
