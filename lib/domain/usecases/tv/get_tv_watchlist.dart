import 'package:dartz/dartz.dart';
import 'package:ditonton/data/models/tv_table.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

import '../../../common/failure.dart';

class GetWatchListTv {
  final TvRepository _repository;

  GetWatchListTv(this._repository);

  Future<Either<Failure, List<TvTable>>> execute() {
    return _repository.getWatchlistTv();
  }
}
