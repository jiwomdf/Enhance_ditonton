import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:core/domain/entities/tv_recommendation.dart';
import 'package:core/domain/repositories/tv_repository.dart';

class GetTvRecomendation {
  final TvRepository _repository;

  GetTvRecomendation(this._repository);

  Future<Either<Failure, List<TvRecomemendation>>> execute(int id) {
    return _repository.getTvRecomendation(id);
  }
}
