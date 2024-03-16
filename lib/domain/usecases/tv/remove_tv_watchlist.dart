import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class RemoveTvWatchlist {
  final TvRepository _repository;

  RemoveTvWatchlist(this._repository);

  Future<Either<Failure, String>> execute(int id) {
    return _repository.removeWatchlistTv(id);
  }
}
