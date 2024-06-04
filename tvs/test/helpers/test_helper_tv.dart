import 'package:core/domain/repositories/tv_repository.dart';
import 'package:core/domain/usecases/tv/get_tv_airing_today.dart';
import 'package:core/domain/usecases/tv/get_tv_popular.dart';
import 'package:core/domain/usecases/tv/get_tv_toprated.dart';
import 'package:mockito/annotations.dart';
import 'package:tvs/domain/usecase/tv/get_tv_detail.dart';
import 'package:tvs/domain/usecase/tv/get_tv_recommendation.dart';
import 'package:tvs/domain/usecase/tv/get_tv_watchlist.dart';
import 'package:tvs/domain/usecase/tv/is_tv_in_watchlist.dart';
import 'package:tvs/domain/usecase/tv/remove_tv_watchlist.dart';
import 'package:tvs/domain/usecase/tv/save_tv_watchlist.dart';

@GenerateMocks([
  GetTvDetail,
  SaveTvWatchlist,
  RemoveTvWatchlist,
  GetTvWatchList,
  IsTvInWatchlist,
  GetTvRecomendation,
  GetTvTopRated,
  TvRepository,
  GetTvPopular,
  GetTvAiringToday,
])
void main() {}
