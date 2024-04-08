import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_recommendation.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class GetTvRecomendation {
  final TvRepository _repository;

  GetTvRecomendation(this._repository);

  Future<Either<Failure, List<TvRecomemendation>>> execute(int id) {
    return _repository.getTvRecomendation(id);
  }
}
