import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_top_rated.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

import '../../../common/failure.dart';

class GetTvTopRated {
  final TvRepository _repository;

  GetTvTopRated(this._repository);

  Future<Either<Failure, List<TvTopRated>>> execute() {
    return _repository.getTvListTopRated();
  }
}
