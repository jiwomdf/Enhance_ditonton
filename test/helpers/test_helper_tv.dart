import 'package:ditonton/data/datasources/tv_local_data_source.dart';
import 'package:ditonton/data/datasources/tv_remote_data_source.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_detail.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_recommendation.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_watchlist.dart';
import 'package:ditonton/domain/usecases/tv/is_tv_in_watchlist.dart';
import 'package:ditonton/domain/usecases/tv/remove_tv_watchlist.dart';
import 'package:ditonton/domain/usecases/tv/save_tv_watchlist.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  TvRepository,
  GetTvDetail,
  SaveTvWatchlist,
  RemoveTvWatchlist,
  GetTvWatchList,
  IsTvInWatchlist,
  TvRemoteDataSource,
  TvLocalDataSource,
  GetTvRecomendation
])
void main() {}
