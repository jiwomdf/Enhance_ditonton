import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_popular.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

import '../../../common/failure.dart';

class GetTvPopular {
  final TvRepository _repository;

  GetTvPopular(this._repository);

  Future<Either<Failure, List<TvPopular>>> execute() {
    return _repository.getTvListPopular();
  }
}
