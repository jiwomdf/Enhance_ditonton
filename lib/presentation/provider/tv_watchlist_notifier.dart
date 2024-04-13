import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_watchlist.dart';
import 'package:flutter/foundation.dart';

class TvWatchlistNotifier extends ChangeNotifier {
  var _watchlistTv = <TV>[];
  List<TV> get watchlistTv => _watchlistTv;

  var _watchlistTvState = RequestState.Empty;
  RequestState get watchlistTvState => _watchlistTvState;

  String _message = '';
  String get message => _message;

  TvWatchlistNotifier({required this.getWatchlistTv});

  final GetTvWatchList getWatchlistTv;

  Future<void> fetchWatchlistTv() async {
    _watchlistTvState = RequestState.Loading;
    notifyListeners();

    final result = await getWatchlistTv.execute();
    result.fold(
      (failure) {
        _watchlistTvState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (TvData) {
        _watchlistTvState = RequestState.Loaded;
        _watchlistTv = TvData;
        notifyListeners();
      },
    );
  }
}
