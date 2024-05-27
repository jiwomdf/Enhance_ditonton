import 'dart:io';

import 'package:core/data/datasources/tv_local_data_source.dart';
import 'package:core/data/datasources/tv_remote_data_source.dart';
import 'package:core/data/models/tv_table.dart';
import 'package:core/domain/entities/tv.dart';
import 'package:core/domain/entities/tv_detail.dart';
import 'package:core/domain/entities/tv_recommendation.dart';
import 'package:core/domain/repositories/tv_repository.dart';
import 'package:core/utils/exception.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

class TvRepositoryImpl extends TvRepository {
  final TvRemoteDataSource remoteDataSource;
  final TvLocalDataSource localDataSource;

  TvRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, TvDetail>> getTvDetail(int id) async {
    try {
      final result = await remoteDataSource.getTvDetail(id);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, String>> saveWatchlistTv(TvDetail tv) async {
    try {
      final result =
          await localDataSource.insertWatchlistTv(TvTable.fromEntity(tv));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, List<TV>>> getWatchlistTv() async {
    try {
      final result = await localDataSource.getWatchlistTv();
      List<TV> resultMap = [];

      for (var e in result) {
        final map = TV.watchlist(
          id: e.id,
          overview: e.overview ?? '',
          posterPath: e.posterPath ?? '',
          name: e.title ?? '',
        );
        resultMap.add(map);
      }

      return Right(resultMap);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, String>> removeWatchlistTv(int id) async {
    try {
      final result = await localDataSource.removeWatchlistTv(id);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, bool>> isTvInWatchlist(int id) async {
    try {
      final result = await localDataSource.isTvInWatchlist(id);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, List<TV>>> searchTv(String query) async {
    try {
      final result = await remoteDataSource.searchTv(query);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<TV>>> getTvListPopular() async {
    try {
      final result = await remoteDataSource.getTvPopular();
      List<TV> listModel = [];
      for (var model in result) {
        listModel.add(model.toEntity());
      }
      return Right(listModel);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<TV>>> getTvListTopRated() async {
    try {
      final result = await remoteDataSource.getTvTopRated();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<TV>>> getTvListAiringToday() async {
    try {
      final result = await remoteDataSource.getTvAiringToday();
      final listResult = result.map((model) => model.toEntity()).toList();
      return Right(listResult);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<TvRecomemendation>>> getTvRecomendation(
      int id) async {
    try {
      final result = await remoteDataSource.getTvRecomendation(id);
      final listResult = result.map((model) => model.toEntity()).toList();
      return Right(listResult);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
