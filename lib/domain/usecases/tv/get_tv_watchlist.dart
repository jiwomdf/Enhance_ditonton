import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

import '../../../common/failure.dart';

class GetTvWatchList {
  final TvRepository _repository;

  GetTvWatchList(this._repository);

  Future<Either<Failure, List<TV>>> execute() {
    return _repository.getWatchlistTv();
  }
}
