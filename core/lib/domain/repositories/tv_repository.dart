import 'package:core/domain/entities/tv.dart';
import 'package:core/domain/entities/tv_detail.dart';
import 'package:core/domain/entities/tv_recommendation.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

abstract class TvRepository {
  Future<Either<Failure, List<TV>>> getTvList();
  Future<Either<Failure, TvDetail>> getTvDetail(int id);
  Future<Either<Failure, String>> saveWatchlistTv(TvDetail tv);
  Future<Either<Failure, String>> removeWatchlistTv(int id);
  Future<Either<Failure, List<TV>>> getWatchlistTv();
  Future<Either<Failure, bool>> isTvInWatchlist(int id);
  Future<Either<Failure, List<TV>>> searchTv(String query);
  Future<Either<Failure, List<TV>>> getTvListPopular();
  Future<Either<Failure, List<TV>>> getTvListTopRated();
  Future<Either<Failure, List<TV>>> getTvListAiringToday();
  Future<Either<Failure, List<TvRecomemendation>>> getTvRecomendation(int id);
}
