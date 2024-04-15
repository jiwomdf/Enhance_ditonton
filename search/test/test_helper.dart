import 'package:core/domain/repositories/movie_repository.dart';
import 'package:core/domain/repositories/tv_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:search/domain/usecases/movie/search_movies.dart';
import 'package:search/domain/usecases/tv/search_tv.dart';

@GenerateMocks([
  SearchMovies,
  SearchTv,
  MovieRepository,
  TvRepository,
])
void main() {}
