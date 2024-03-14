import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_detail.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_detail.dart';
import 'package:ditonton/domain/usecases/tv/save_tv_watchlist.dart';
import 'package:flutter/material.dart';

class TvDetailNotifier extends ChangeNotifier {
  final GetTvDetail getTvDetail;
  final SaveTvWatchlist saveTvWatchlist;

  TvDetailNotifier({required this.getTvDetail, required this.saveTvWatchlist});

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

  Future<void> addWatchlist(TvDetail movie) async {
    final result = await saveTvWatchlist.execute(movie);

    // await result.fold(
    //   (failure) async {
    //     _watchlistMessage = failure.message;
    //   },
    //   (successMessage) async {
    //     _watchlistMessage = successMessage;
    //   },
    // );
    // await loadWatchlistStatus(movie.id);
  }

  // Future<void> removeFromWatchlist(MovieDetail movie) async {
  //   final result = await removeWatchlist.execute(movie);

  //   await result.fold(
  //     (failure) async {
  //       _watchlistMessage = failure.message;
  //     },
  //     (successMessage) async {
  //       _watchlistMessage = successMessage;
  //     },
  //   );

  //   await loadWatchlistStatus(movie.id);
  // }

  // Future<void> loadWatchlistStatus(int id) async {
  //   final result = await getWatchListStatus.execute(id);
  //   _isAddedtoWatchlist = result;
  //   notifyListeners();
  // }
}
