import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv.dart';
import 'package:core/domain/entities/tv_detail.dart';
import 'package:equatable/equatable.dart';
import 'package:tvs/domain/usecase/tv/get_tv_watchlist.dart';
import 'package:tvs/domain/usecase/tv/is_tv_in_watchlist.dart';
import 'package:tvs/domain/usecase/tv/remove_tv_watchlist.dart';
import 'package:tvs/domain/usecase/tv/save_tv_watchlist.dart';

part 'tv_watchlist_event.dart';
part 'tv_watchlist_state.dart';

class TvWatchlistBloc extends Bloc<TvWatchlistEvent, TvWatchlistState> {
  final GetTvWatchList getTvWatchList;
  final IsTvInWatchlist isTvInWatchlist;
  final SaveTvWatchlist saveTvWatchlist;
  final RemoveTvWatchlist removeTvWatchlist;

  TvWatchlistBloc(
    this.getTvWatchList,
    this.isTvInWatchlist,
    this.saveTvWatchlist,
    this.removeTvWatchlist,
  ) : super(TvWatchlistLoading()) {
    on<GetTvWatchlistEvent>((event, emit) async {
      emit(TvWatchlistLoading());
      final result = await getTvWatchList.execute();

      result.fold(
        (failure) {
          emit(TvWatchlistError(failure.message));
        },
        (data) {
          emit(TvWatchlistHasData(data));
        },
      );
    });

    on<RemoveTvWatchlistEvent>((event, emit) async {
      final result = await removeTvWatchlist.execute(event.id);
      var message = "";
      result.fold(
        (failure) {
          emit(TvWatchlistError(failure.message));
        },
        (data) {
          message = data;
        },
      );

      final resultStatus = await isTvInWatchlist.execute(event.id);
      resultStatus.fold(
        (failure) {
          emit(TvWatchlistError(failure.message));
        },
        (data) {
          emit(TvWatchlistIsAddedWatchlist(data, message));
        },
      );
    });

    on<SaveTvWatchlistEvent>((event, emit) async {
      final result = await saveTvWatchlist.execute(event.tvDetail);
      var message = "";
      result.fold(
        (failure) {
          emit(TvWatchlistError(failure.message));
        },
        (data) {
          message = data;
        },
      );

      final resultStatus = await isTvInWatchlist.execute(event.tvDetail.id);
      resultStatus.fold(
        (failure) {
          emit(TvWatchlistError(failure.message));
        },
        (data) {
          emit(TvWatchlistIsAddedWatchlist(data, message));
        },
      );
    });

    on<IsTvInWatchlistEvent>((event, emit) async {
      final result = await isTvInWatchlist.execute(event.id);
      result.fold(
        (failure) {
          emit(TvWatchlistError(failure.message));
        },
        (data) {
          emit(TvWatchlistIsAddedWatchlist(data, ""));
        },
      );
    });
  }
}
