import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/entities/tv_detail.dart';

abstract class TvRepository {
  Future<Either<Failure, List<TV>>> getTvList();
  Future<Either<Failure, TvDetail>> getTvDetail(int id);
  Future<Either<Failure, String>> saveWatchlistTv(TvDetail tv);
  Future<Either<Failure, String>> removeWatchlistTv(int id);
  Future<Either<Failure, List<TV>>> getWatchlistTv();
  Future<Either<Failure, bool>> isTvInWatchlist(int id);
  Future<Either<Failure, List<TV>>> searchTv(String query);
}
