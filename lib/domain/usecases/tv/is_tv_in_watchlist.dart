import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';
import '../../../common/failure.dart';

class IsTvInWatchlist {
  final TvRepository _repository;

  IsTvInWatchlist(this._repository);

  Future<Either<Failure, bool>> execute(int id) {
    return _repository.isTvInWatchlist(id);
  }
}
