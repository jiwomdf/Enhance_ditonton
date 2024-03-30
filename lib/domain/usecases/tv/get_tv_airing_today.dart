import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_airing_today.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

import '../../../common/failure.dart';

class GetTvAiringToday {
  final TvRepository _repository;

  GetTvAiringToday(this._repository);

  Future<Either<Failure, List<TvAiringToday>>> execute() {
    return _repository.getTvListAiringToday();
  }
}
