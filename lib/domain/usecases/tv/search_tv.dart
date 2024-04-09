import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class SearchTv {
  final TvRepository repository;

  SearchTv(this.repository);

  Future<Either<Failure, List<TV>>> execute(String query) {
    return repository.searchTv(query);
  }
}
