import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:core/domain/repositories/tv_repository.dart';

class IsTvInWatchlist {
  final TvRepository _repository;

  IsTvInWatchlist(this._repository);

  Future<Either<Failure, bool>> execute(int id) {
    return _repository.isTvInWatchlist(id);
  }
}
