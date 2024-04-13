import 'package:core/domain/repositories/tv_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:tvs/domain/usecases/tv/get_tv_detail.dart';
import 'package:tvs/domain/usecases/tv/get_tv_recommendation.dart';
import 'package:tvs/domain/usecases/tv/get_tv_watchlist.dart';
import 'package:tvs/domain/usecases/tv/is_tv_in_watchlist.dart';
import 'package:tvs/domain/usecases/tv/remove_tv_watchlist.dart';
import 'package:tvs/domain/usecases/tv/save_tv_watchlist.dart';

@GenerateMocks([
  GetTvDetail,
  SaveTvWatchlist,
  RemoveTvWatchlist,
  GetTvWatchList,
  IsTvInWatchlist,
  GetTvRecomendation,
  TvRepository
])
void main() {}