import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_detail.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_detail.dart';
import 'package:ditonton/domain/usecases/tv/is_tv_in_watchlist.dart';
import 'package:ditonton/domain/usecases/tv/remove_tv_watchlist.dart';
import 'package:ditonton/domain/usecases/tv/save_tv_watchlist.dart';
import 'package:flutter/material.dart';

class TvDetailNotifier extends ChangeNotifier {
  static const watchlistAddSuccessMessage = 'Added to WatchlistTv';
  static const watchlistRemoveSuccessMessage = 'Removed from WatchlistTv';

  final GetTvDetail getTvDetail;
  final SaveTvWatchlist saveTvWatchlist;
  final RemoveTvWatchlist removeTvWatchlist;
  final IsTvInWatchlist isTvInWatchlist;

  TvDetailNotifier({
    required this.getTvDetail,
    required this.saveTvWatchlist,
    required this.removeTvWatchlist,
    required this.isTvInWatchlist,
  });

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  TvDetail? _tvDetail = null;
  TvDetail? get tvDetail => _tvDetail;

  String _messageTvDetail = '';
  String get messageTvDetail => _messageTvDetail;

  String _watchlistMessage = '';
  String get watchlistMessage => _watchlistMessage;

  bool _isAddedtoWatchlist = false;
  bool get isAddedToWatchlist => _isAddedtoWatchlist;

  Future<void> fetchTvDetail(int id) async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getTvDetail.execute(id);
    result.fold(
      (failure) {
        _messageTvDetail = failure.message;
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

  Future<void> addWatchlist(TvDetail movie) async {
    final result = await saveTvWatchlist.execute(movie);
    await result.fold(
      (failure) async {
        _watchlistMessage = failure.message;
      },
      (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );
    await loadWatchlistStatus(movie.id);
  }

  Future<void> removeFromWatchlist(TvDetail tv) async {
    final result = await removeTvWatchlist.execute(tv.id);
    await result.fold(
      (failure) async {
        _watchlistMessage = failure.message;
      },
      (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );
    await loadWatchlistStatus(tv.id);
  }

  Future<void> loadWatchlistStatus(int id) async {
    final result = await isTvInWatchlist.execute(id);
    await result.fold(
      (failure) async {
        _watchlistMessage = failure.message;
      },
      (result) async {
        _isAddedtoWatchlist = result;
      },
    );
    notifyListeners();
  }
}
