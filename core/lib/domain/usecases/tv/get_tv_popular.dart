import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:core/domain/entities/tv.dart';
import 'package:core/domain/repositories/tv_repository.dart';

class GetTvPopular {
  final TvRepository _repository;

  GetTvPopular(this._repository);

  Future<Either<Failure, List<TV>>> execute() {
    return _repository.getTvListPopular();
  }
}
