// import 'package:core/presentation/provider/popular_movies_notifier.dart';
// import 'package:core/utils/failure.dart';
// import 'package:core/utils/state_enum.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// import '../../../../test/dummy_data/dummy_objects.dart';
// import '../../helper/test_helper_movie.mocks.dart';

// void main() {
//   late PopularMoviesNotifier provider;
//   late MockGetPopularMovies mockGetPopularMovies;

//   setUp(() {
//     mockGetPopularMovies = MockGetPopularMovies();

//     provider = PopularMoviesNotifier(mockGetPopularMovies)..addListener(() {});
//   });

//   void _arrangeUsecase() {
//     when(mockGetPopularMovies.execute())
//         .thenAnswer((_) async => Right([testMovie]));
//   }

//   group('Get TvPopular', () {
//     test('should get data from the usecase', () async {
//       _arrangeUsecase();
//       await provider.fetchPopularMovies();
//       verify(mockGetPopularMovies.execute());
//       expect(provider.state, RequestState.loaded);
//       expect(provider.movies, [testMovie]);
//     });

//     test('should return error when data is unsuccessful', () async {
//       when(mockGetPopularMovies.execute())
//           .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
//       await provider.fetchPopularMovies();
//       expect(provider.state, RequestState.error);
//       expect(provider.message, 'Server Failure');
//     });
//   });
// }
// TODO(jiwo): enhance this