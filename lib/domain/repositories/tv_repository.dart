import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/entities/tv_airing_today.dart';
import 'package:ditonton/domain/entities/tv_detail.dart';
import 'package:ditonton/domain/entities/tv_popular.dart';
import 'package:ditonton/domain/entities/tv_top_rated.dart';

abstract class TvRepository {
  Future<Either<Failure, List<TV>>> getTvList();
  Future<Either<Failure, TvDetail>> getTvDetail(int id);
  Future<Either<Failure, String>> saveWatchlistTv(TvDetail tv);
  Future<Either<Failure, String>> removeWatchlistTv(int id);
  Future<Either<Failure, List<TV>>> getWatchlistTv();
  Future<Either<Failure, bool>> isTvInWatchlist(int id);
  Future<Either<Failure, List<TV>>> searchTv(String query);
  Future<Either<Failure, List<TvPopular>>> getTvListPopular();
  Future<Either<Failure, List<TvTopRated>>> getTvListTopRated();
  Future<Either<Failure, List<TvAiringToday>>> getTvListAiringToday();
}
