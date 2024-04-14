import 'package:mockito/annotations.dart';
import 'package:search/domain/usecases/movie/search_movies.dart';
import 'package:search/domain/usecases/tv/search_tv.dart';

@GenerateMocks([
  SearchMovies,
  SearchTv,
])
void main() {}
