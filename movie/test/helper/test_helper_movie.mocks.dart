// Mocks generated by Mockito 5.4.4 from annotations
// in movie/test/helper/test_helper_movie.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i13;
import 'dart:ui' as _i19;

import 'package:core/domain/entities/movie.dart' as _i15;
import 'package:core/domain/entities/movie_detail.dart' as _i11;
import 'package:core/domain/repositories/movie_repository.dart' as _i3;
import 'package:core/domain/usecases/movie/get_popular_movies.dart' as _i4;
import 'package:core/domain/usecases/movie/get_top_rated_movies.dart' as _i5;
import 'package:core/presentation/bloc/popular_movies_notifier.dart' as _i16;
import 'package:core/presentation/bloc/top_rated_movies_notifier.dart' as _i20;
import 'package:core/utils/failure.dart' as _i14;
import 'package:core/utils/state_enum.dart' as _i17;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i18;
import 'package:movie/domain/usecases/movie/get_movie_detail.dart' as _i6;
import 'package:movie/domain/usecases/movie/get_movie_recommendations.dart'
    as _i7;
import 'package:movie/domain/usecases/movie/get_watchlist_movies.dart' as _i12;
import 'package:movie/domain/usecases/movie/get_watchlist_status.dart' as _i8;
import 'package:movie/domain/usecases/movie/remove_watchlist.dart' as _i10;
import 'package:movie/domain/usecases/movie/save_watchlist.dart' as _i9;
import 'package:movie/presentation/bloc/movie_detail_notifier.dart' as _i21;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMovieRepository_1 extends _i1.SmartFake
    implements _i3.MovieRepository {
  _FakeMovieRepository_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetPopularMovies_2 extends _i1.SmartFake
    implements _i4.GetPopularMovies {
  _FakeGetPopularMovies_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetTopRatedMovies_3 extends _i1.SmartFake
    implements _i5.GetTopRatedMovies {
  _FakeGetTopRatedMovies_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetMovieDetail_4 extends _i1.SmartFake
    implements _i6.GetMovieDetail {
  _FakeGetMovieDetail_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetMovieRecommendations_5 extends _i1.SmartFake
    implements _i7.GetMovieRecommendations {
  _FakeGetMovieRecommendations_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetWatchListStatus_6 extends _i1.SmartFake
    implements _i8.GetWatchListStatus {
  _FakeGetWatchListStatus_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSaveWatchlist_7 extends _i1.SmartFake implements _i9.SaveWatchlist {
  _FakeSaveWatchlist_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRemoveWatchlist_8 extends _i1.SmartFake
    implements _i10.RemoveWatchlist {
  _FakeRemoveWatchlist_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMovieDetail_9 extends _i1.SmartFake implements _i11.MovieDetail {
  _FakeMovieDetail_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetWatchlistMovies].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchlistMovies extends _i1.Mock
    implements _i12.GetWatchlistMovies {
  MockGetWatchlistMovies() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i13.Future<_i2.Either<_i14.Failure, List<_i15.Movie>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue:
            _i13.Future<_i2.Either<_i14.Failure, List<_i15.Movie>>>.value(
                _FakeEither_0<_i14.Failure, List<_i15.Movie>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i13.Future<_i2.Either<_i14.Failure, List<_i15.Movie>>>);
}

/// A class which mocks [GetMovieDetail].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetMovieDetail extends _i1.Mock implements _i6.GetMovieDetail {
  MockGetMovieDetail() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.MovieRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeMovieRepository_1(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i3.MovieRepository);

  @override
  _i13.Future<_i2.Either<_i14.Failure, _i11.MovieDetail>> execute(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue:
            _i13.Future<_i2.Either<_i14.Failure, _i11.MovieDetail>>.value(
                _FakeEither_0<_i14.Failure, _i11.MovieDetail>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i13.Future<_i2.Either<_i14.Failure, _i11.MovieDetail>>);
}

/// A class which mocks [GetMovieRecommendations].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetMovieRecommendations extends _i1.Mock
    implements _i7.GetMovieRecommendations {
  MockGetMovieRecommendations() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.MovieRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeMovieRepository_1(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i3.MovieRepository);

  @override
  _i13.Future<_i2.Either<_i14.Failure, List<_i15.Movie>>> execute(dynamic id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue:
            _i13.Future<_i2.Either<_i14.Failure, List<_i15.Movie>>>.value(
                _FakeEither_0<_i14.Failure, List<_i15.Movie>>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i13.Future<_i2.Either<_i14.Failure, List<_i15.Movie>>>);
}

/// A class which mocks [GetWatchListStatus].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchListStatus extends _i1.Mock
    implements _i8.GetWatchListStatus {
  MockGetWatchListStatus() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.MovieRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeMovieRepository_1(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i3.MovieRepository);

  @override
  _i13.Future<bool> execute(int? id) => (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue: _i13.Future<bool>.value(false),
      ) as _i13.Future<bool>);
}

/// A class which mocks [GetPopularMovies].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetPopularMovies extends _i1.Mock implements _i4.GetPopularMovies {
  MockGetPopularMovies() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.MovieRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeMovieRepository_1(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i3.MovieRepository);

  @override
  _i13.Future<_i2.Either<_i14.Failure, List<_i15.Movie>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue:
            _i13.Future<_i2.Either<_i14.Failure, List<_i15.Movie>>>.value(
                _FakeEither_0<_i14.Failure, List<_i15.Movie>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i13.Future<_i2.Either<_i14.Failure, List<_i15.Movie>>>);
}

/// A class which mocks [SaveWatchlist].
///
/// See the documentation for Mockito's code generation for more information.
class MockSaveWatchlist extends _i1.Mock implements _i9.SaveWatchlist {
  MockSaveWatchlist() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.MovieRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeMovieRepository_1(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i3.MovieRepository);

  @override
  _i13.Future<_i2.Either<_i14.Failure, String>> execute(
          _i11.MovieDetail? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [movie],
        ),
        returnValue: _i13.Future<_i2.Either<_i14.Failure, String>>.value(
            _FakeEither_0<_i14.Failure, String>(
          this,
          Invocation.method(
            #execute,
            [movie],
          ),
        )),
      ) as _i13.Future<_i2.Either<_i14.Failure, String>>);
}

/// A class which mocks [RemoveWatchlist].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoveWatchlist extends _i1.Mock implements _i10.RemoveWatchlist {
  MockRemoveWatchlist() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.MovieRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeMovieRepository_1(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i3.MovieRepository);

  @override
  _i13.Future<_i2.Either<_i14.Failure, String>> execute(
          _i11.MovieDetail? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [movie],
        ),
        returnValue: _i13.Future<_i2.Either<_i14.Failure, String>>.value(
            _FakeEither_0<_i14.Failure, String>(
          this,
          Invocation.method(
            #execute,
            [movie],
          ),
        )),
      ) as _i13.Future<_i2.Either<_i14.Failure, String>>);
}

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i3.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i13.Future<_i2.Either<_i14.Failure, List<_i15.Movie>>>
      getNowPlayingMovies() => (super.noSuchMethod(
            Invocation.method(
              #getNowPlayingMovies,
              [],
            ),
            returnValue:
                _i13.Future<_i2.Either<_i14.Failure, List<_i15.Movie>>>.value(
                    _FakeEither_0<_i14.Failure, List<_i15.Movie>>(
              this,
              Invocation.method(
                #getNowPlayingMovies,
                [],
              ),
            )),
          ) as _i13.Future<_i2.Either<_i14.Failure, List<_i15.Movie>>>);

  @override
  _i13.Future<_i2.Either<_i14.Failure, List<_i15.Movie>>> getPopularMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [],
        ),
        returnValue:
            _i13.Future<_i2.Either<_i14.Failure, List<_i15.Movie>>>.value(
                _FakeEither_0<_i14.Failure, List<_i15.Movie>>(
          this,
          Invocation.method(
            #getPopularMovies,
            [],
          ),
        )),
      ) as _i13.Future<_i2.Either<_i14.Failure, List<_i15.Movie>>>);

  @override
  _i13.Future<_i2.Either<_i14.Failure, List<_i15.Movie>>> getTopRatedMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedMovies,
          [],
        ),
        returnValue:
            _i13.Future<_i2.Either<_i14.Failure, List<_i15.Movie>>>.value(
                _FakeEither_0<_i14.Failure, List<_i15.Movie>>(
          this,
          Invocation.method(
            #getTopRatedMovies,
            [],
          ),
        )),
      ) as _i13.Future<_i2.Either<_i14.Failure, List<_i15.Movie>>>);

  @override
  _i13.Future<_i2.Either<_i14.Failure, _i11.MovieDetail>> getMovieDetail(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieDetail,
          [id],
        ),
        returnValue:
            _i13.Future<_i2.Either<_i14.Failure, _i11.MovieDetail>>.value(
                _FakeEither_0<_i14.Failure, _i11.MovieDetail>(
          this,
          Invocation.method(
            #getMovieDetail,
            [id],
          ),
        )),
      ) as _i13.Future<_i2.Either<_i14.Failure, _i11.MovieDetail>>);

  @override
  _i13.Future<_i2.Either<_i14.Failure, List<_i15.Movie>>>
      getMovieRecommendations(int? id) => (super.noSuchMethod(
            Invocation.method(
              #getMovieRecommendations,
              [id],
            ),
            returnValue:
                _i13.Future<_i2.Either<_i14.Failure, List<_i15.Movie>>>.value(
                    _FakeEither_0<_i14.Failure, List<_i15.Movie>>(
              this,
              Invocation.method(
                #getMovieRecommendations,
                [id],
              ),
            )),
          ) as _i13.Future<_i2.Either<_i14.Failure, List<_i15.Movie>>>);

  @override
  _i13.Future<_i2.Either<_i14.Failure, List<_i15.Movie>>> searchMovies(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchMovies,
          [query],
        ),
        returnValue:
            _i13.Future<_i2.Either<_i14.Failure, List<_i15.Movie>>>.value(
                _FakeEither_0<_i14.Failure, List<_i15.Movie>>(
          this,
          Invocation.method(
            #searchMovies,
            [query],
          ),
        )),
      ) as _i13.Future<_i2.Either<_i14.Failure, List<_i15.Movie>>>);

  @override
  _i13.Future<_i2.Either<_i14.Failure, String>> saveWatchlist(
          _i11.MovieDetail? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveWatchlist,
          [movie],
        ),
        returnValue: _i13.Future<_i2.Either<_i14.Failure, String>>.value(
            _FakeEither_0<_i14.Failure, String>(
          this,
          Invocation.method(
            #saveWatchlist,
            [movie],
          ),
        )),
      ) as _i13.Future<_i2.Either<_i14.Failure, String>>);

  @override
  _i13.Future<_i2.Either<_i14.Failure, String>> removeWatchlist(
          _i11.MovieDetail? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [movie],
        ),
        returnValue: _i13.Future<_i2.Either<_i14.Failure, String>>.value(
            _FakeEither_0<_i14.Failure, String>(
          this,
          Invocation.method(
            #removeWatchlist,
            [movie],
          ),
        )),
      ) as _i13.Future<_i2.Either<_i14.Failure, String>>);

  @override
  _i13.Future<bool> isAddedToWatchlist(int? id) => (super.noSuchMethod(
        Invocation.method(
          #isAddedToWatchlist,
          [id],
        ),
        returnValue: _i13.Future<bool>.value(false),
      ) as _i13.Future<bool>);

  @override
  _i13.Future<_i2.Either<_i14.Failure, List<_i15.Movie>>>
      getWatchlistMovies() => (super.noSuchMethod(
            Invocation.method(
              #getWatchlistMovies,
              [],
            ),
            returnValue:
                _i13.Future<_i2.Either<_i14.Failure, List<_i15.Movie>>>.value(
                    _FakeEither_0<_i14.Failure, List<_i15.Movie>>(
              this,
              Invocation.method(
                #getWatchlistMovies,
                [],
              ),
            )),
          ) as _i13.Future<_i2.Either<_i14.Failure, List<_i15.Movie>>>);
}

/// A class which mocks [PopularMoviesNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockPopularMoviesNotifier extends _i1.Mock
    implements _i16.PopularMoviesNotifier {
  MockPopularMoviesNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.GetPopularMovies get getPopularMovies => (super.noSuchMethod(
        Invocation.getter(#getPopularMovies),
        returnValue: _FakeGetPopularMovies_2(
          this,
          Invocation.getter(#getPopularMovies),
        ),
      ) as _i4.GetPopularMovies);

  @override
  _i17.RequestState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _i17.RequestState.empty,
      ) as _i17.RequestState);

  @override
  List<_i15.Movie> get movies => (super.noSuchMethod(
        Invocation.getter(#movies),
        returnValue: <_i15.Movie>[],
      ) as List<_i15.Movie>);

  @override
  String get message => (super.noSuchMethod(
        Invocation.getter(#message),
        returnValue: _i18.dummyValue<String>(
          this,
          Invocation.getter(#message),
        ),
      ) as String);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  _i13.Future<void> fetchPopularMovies() => (super.noSuchMethod(
        Invocation.method(
          #fetchPopularMovies,
          [],
        ),
        returnValue: _i13.Future<void>.value(),
        returnValueForMissingStub: _i13.Future<void>.value(),
      ) as _i13.Future<void>);

  @override
  void addListener(_i19.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i19.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [TopRatedMoviesNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockTopRatedMoviesNotifier extends _i1.Mock
    implements _i20.TopRatedMoviesNotifier {
  MockTopRatedMoviesNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.GetTopRatedMovies get getTopRatedMovies => (super.noSuchMethod(
        Invocation.getter(#getTopRatedMovies),
        returnValue: _FakeGetTopRatedMovies_3(
          this,
          Invocation.getter(#getTopRatedMovies),
        ),
      ) as _i5.GetTopRatedMovies);

  @override
  _i17.RequestState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _i17.RequestState.empty,
      ) as _i17.RequestState);

  @override
  List<_i15.Movie> get movies => (super.noSuchMethod(
        Invocation.getter(#movies),
        returnValue: <_i15.Movie>[],
      ) as List<_i15.Movie>);

  @override
  String get message => (super.noSuchMethod(
        Invocation.getter(#message),
        returnValue: _i18.dummyValue<String>(
          this,
          Invocation.getter(#message),
        ),
      ) as String);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  _i13.Future<void> fetchTopRatedMovies() => (super.noSuchMethod(
        Invocation.method(
          #fetchTopRatedMovies,
          [],
        ),
        returnValue: _i13.Future<void>.value(),
        returnValueForMissingStub: _i13.Future<void>.value(),
      ) as _i13.Future<void>);

  @override
  void addListener(_i19.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i19.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [MovieDetailNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieDetailNotifier extends _i1.Mock
    implements _i21.MovieDetailNotifier {
  MockMovieDetailNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.GetMovieDetail get getMovieDetail => (super.noSuchMethod(
        Invocation.getter(#getMovieDetail),
        returnValue: _FakeGetMovieDetail_4(
          this,
          Invocation.getter(#getMovieDetail),
        ),
      ) as _i6.GetMovieDetail);

  @override
  _i7.GetMovieRecommendations get getMovieRecommendations =>
      (super.noSuchMethod(
        Invocation.getter(#getMovieRecommendations),
        returnValue: _FakeGetMovieRecommendations_5(
          this,
          Invocation.getter(#getMovieRecommendations),
        ),
      ) as _i7.GetMovieRecommendations);

  @override
  _i8.GetWatchListStatus get getWatchListStatus => (super.noSuchMethod(
        Invocation.getter(#getWatchListStatus),
        returnValue: _FakeGetWatchListStatus_6(
          this,
          Invocation.getter(#getWatchListStatus),
        ),
      ) as _i8.GetWatchListStatus);

  @override
  _i9.SaveWatchlist get saveWatchlist => (super.noSuchMethod(
        Invocation.getter(#saveWatchlist),
        returnValue: _FakeSaveWatchlist_7(
          this,
          Invocation.getter(#saveWatchlist),
        ),
      ) as _i9.SaveWatchlist);

  @override
  _i10.RemoveWatchlist get removeWatchlist => (super.noSuchMethod(
        Invocation.getter(#removeWatchlist),
        returnValue: _FakeRemoveWatchlist_8(
          this,
          Invocation.getter(#removeWatchlist),
        ),
      ) as _i10.RemoveWatchlist);

  @override
  _i11.MovieDetail get movie => (super.noSuchMethod(
        Invocation.getter(#movie),
        returnValue: _FakeMovieDetail_9(
          this,
          Invocation.getter(#movie),
        ),
      ) as _i11.MovieDetail);

  @override
  _i17.RequestState get movieState => (super.noSuchMethod(
        Invocation.getter(#movieState),
        returnValue: _i17.RequestState.empty,
      ) as _i17.RequestState);

  @override
  List<_i15.Movie> get movieRecommendations => (super.noSuchMethod(
        Invocation.getter(#movieRecommendations),
        returnValue: <_i15.Movie>[],
      ) as List<_i15.Movie>);

  @override
  _i17.RequestState get recommendationState => (super.noSuchMethod(
        Invocation.getter(#recommendationState),
        returnValue: _i17.RequestState.empty,
      ) as _i17.RequestState);

  @override
  String get message => (super.noSuchMethod(
        Invocation.getter(#message),
        returnValue: _i18.dummyValue<String>(
          this,
          Invocation.getter(#message),
        ),
      ) as String);

  @override
  bool get isAddedToWatchlist => (super.noSuchMethod(
        Invocation.getter(#isAddedToWatchlist),
        returnValue: false,
      ) as bool);

  @override
  String get watchlistMessage => (super.noSuchMethod(
        Invocation.getter(#watchlistMessage),
        returnValue: _i18.dummyValue<String>(
          this,
          Invocation.getter(#watchlistMessage),
        ),
      ) as String);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  _i13.Future<void> fetchMovieDetail(int? id) => (super.noSuchMethod(
        Invocation.method(
          #fetchMovieDetail,
          [id],
        ),
        returnValue: _i13.Future<void>.value(),
        returnValueForMissingStub: _i13.Future<void>.value(),
      ) as _i13.Future<void>);

  @override
  _i13.Future<void> addWatchlist(_i11.MovieDetail? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #addWatchlist,
          [movie],
        ),
        returnValue: _i13.Future<void>.value(),
        returnValueForMissingStub: _i13.Future<void>.value(),
      ) as _i13.Future<void>);

  @override
  _i13.Future<void> removeFromWatchlist(_i11.MovieDetail? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeFromWatchlist,
          [movie],
        ),
        returnValue: _i13.Future<void>.value(),
        returnValueForMissingStub: _i13.Future<void>.value(),
      ) as _i13.Future<void>);

  @override
  _i13.Future<void> loadWatchlistStatus(int? id) => (super.noSuchMethod(
        Invocation.method(
          #loadWatchlistStatus,
          [id],
        ),
        returnValue: _i13.Future<void>.value(),
        returnValueForMissingStub: _i13.Future<void>.value(),
      ) as _i13.Future<void>);

  @override
  void addListener(_i19.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i19.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
