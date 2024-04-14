import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv.dart';
import 'package:core/domain/usecases/tv/get_tv_toprated.dart';
import 'package:equatable/equatable.dart';

part 'tv_top_rated_event.dart';
part 'tv_top_rated_state.dart';

class TvTopRatedBloc extends Bloc<TvTopRatedEvent, TvTopRatedState> {
  final GetTvTopRated _getTvTopRated;

  TvTopRatedBloc(this._getTvTopRated) : super(TvTopRatedEmpty()) {
    on<TvTopRatedEvent>((event, emit) async {
      emit(TvTopRatedLoading());
      final result = await _getTvTopRated.execute();

      result.fold(
        (failure) {
          emit(TvTopRatedError(failure.message));
        },
        (data) {
          emit(TvTopRatedHasData(data));
        },
      );
    });
  }
}
