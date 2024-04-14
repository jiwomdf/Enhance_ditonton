import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv.dart';
import 'package:core/domain/usecases/tv/get_tv_popular.dart';
import 'package:equatable/equatable.dart';

part 'tv_series_popular_event.dart';
part 'tv_series_popular_state.dart';

class TvSeriesPopularBloc
    extends Bloc<TvSeriesPopularEvent, TvSeriesPopularState> {
  final GetTvPopular _getTvPopular;

  TvSeriesPopularBloc(this._getTvPopular) : super(TvSeriesPopularEmpty()) {
    on<TvSeriesPopularEvent>((event, emit) async {
      emit(TvSeriesPopularLoading());
      final result = await _getTvPopular.execute();

      result.fold(
        (failure) {
          emit(TvSeriesPopularError(failure.message));
        },
        (data) {
          emit(TvSeriesPopularHasData(data));
        },
      );
    });
  }
}
