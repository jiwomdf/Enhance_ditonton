import 'package:core/domain/repositories/tv_repository.dart';
import 'package:core/domain/usecases/tv/get_tv_airing_today.dart';
import 'package:core/domain/usecases/tv/get_tv_detail.dart';
import 'package:core/domain/usecases/tv/get_tv_list.dart';
import 'package:core/domain/usecases/tv/get_tv_popular.dart';
import 'package:core/domain/usecases/tv/get_tv_recommendation.dart';
import 'package:core/domain/usecases/tv/get_tv_toprated.dart';
import 'package:core/domain/usecases/tv/get_tv_watchlist.dart';
import 'package:core/domain/usecases/tv/is_tv_in_watchlist.dart';
import 'package:core/domain/usecases/tv/remove_tv_watchlist.dart';
import 'package:core/domain/usecases/tv/save_tv_watchlist.dart';
import 'package:mockito/annotations.dart';
import 'package:tvs/tvs.dart';

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
  GetTvList
])
void main() {}
