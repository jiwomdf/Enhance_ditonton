import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class GetTvTopRated {
  final TvRepository _repository;

  GetTvTopRated(this._repository);

  Future<Either<Failure, List<TV>>> execute() {
    return _repository.getTvListTopRated();
  }
}
