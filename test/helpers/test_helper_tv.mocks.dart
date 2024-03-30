// Mocks generated by Mockito 5.4.4 from annotations
// in ditonton/test/helpers/test_helper_tv.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i2;
import 'package:ditonton/common/failure.dart' as _i6;
import 'package:ditonton/data/datasources/tv_local_data_source.dart' as _i20;
import 'package:ditonton/data/datasources/tv_remote_data_source.dart' as _i14;
import 'package:ditonton/data/models/tv_airing_today_model.dart' as _i19;
import 'package:ditonton/data/models/tv_detail_model.dart' as _i4;
import 'package:ditonton/data/models/tv_list_model.dart' as _i15;
import 'package:ditonton/data/models/tv_popular_model.dart' as _i17;
import 'package:ditonton/data/models/tv_search_model.dart' as _i16;
import 'package:ditonton/data/models/tv_table.dart' as _i21;
import 'package:ditonton/data/models/tv_toprated_model.dart' as _i18;
import 'package:ditonton/domain/entities/tv.dart' as _i7;
import 'package:ditonton/domain/entities/tv_detail.dart' as _i8;
import 'package:ditonton/domain/repositories/tv_repository.dart' as _i3;
import 'package:ditonton/domain/usecases/tv/get_tv_detail.dart' as _i9;
import 'package:ditonton/domain/usecases/tv/get_tv_watchlist.dart' as _i12;
import 'package:ditonton/domain/usecases/tv/is_tv_in_watchlist.dart' as _i13;
import 'package:ditonton/domain/usecases/tv/remove_tv_watchlist.dart' as _i11;
import 'package:ditonton/domain/usecases/tv/save_tv_watchlist.dart' as _i10;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i22;

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

class _FakeTvRepository_1 extends _i1.SmartFake implements _i3.TvRepository {
  _FakeTvRepository_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTvDetailModel_2 extends _i1.SmartFake implements _i4.TvDetailModel {
  _FakeTvDetailModel_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TvRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvRepository extends _i1.Mock implements _i3.TvRepository {
  MockTvRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>> getTvList() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvList,
          [],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>>.value(
            _FakeEither_0<_i6.Failure, List<_i7.TV>>(
          this,
          Invocation.method(
            #getTvList,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, _i8.TvDetail>> getTvDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvDetail,
          [id],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, _i8.TvDetail>>.value(
            _FakeEither_0<_i6.Failure, _i8.TvDetail>(
          this,
          Invocation.method(
            #getTvDetail,
            [id],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i8.TvDetail>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, String>> saveWatchlistTv(
          _i8.TvDetail? tv) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveWatchlistTv,
          [tv],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, String>>.value(
            _FakeEither_0<_i6.Failure, String>(
          this,
          Invocation.method(
            #saveWatchlistTv,
            [tv],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, String>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, String>> removeWatchlistTv(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlistTv,
          [id],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, String>>.value(
            _FakeEither_0<_i6.Failure, String>(
          this,
          Invocation.method(
            #removeWatchlistTv,
            [id],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, String>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>> getWatchlistTv() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTv,
          [],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>>.value(
            _FakeEither_0<_i6.Failure, List<_i7.TV>>(
          this,
          Invocation.method(
            #getWatchlistTv,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, bool>> isTvInWatchlist(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #isTvInWatchlist,
          [id],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, bool>>.value(
            _FakeEither_0<_i6.Failure, bool>(
          this,
          Invocation.method(
            #isTvInWatchlist,
            [id],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, bool>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>> searchTv(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTv,
          [query],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>>.value(
            _FakeEither_0<_i6.Failure, List<_i7.TV>>(
          this,
          Invocation.method(
            #searchTv,
            [query],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>> getTvListPopular() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvListPopular,
          [],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>>.value(
            _FakeEither_0<_i6.Failure, List<_i7.TV>>(
          this,
          Invocation.method(
            #getTvListPopular,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>> getTvListTopRated() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvListTopRated,
          [],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>>.value(
            _FakeEither_0<_i6.Failure, List<_i7.TV>>(
          this,
          Invocation.method(
            #getTvListTopRated,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>> getTvListAiringToday() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvListAiringToday,
          [],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>>.value(
            _FakeEither_0<_i6.Failure, List<_i7.TV>>(
          this,
          Invocation.method(
            #getTvListAiringToday,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>>);
}

/// A class which mocks [GetTvDetail].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTvDetail extends _i1.Mock implements _i9.GetTvDetail {
  MockGetTvDetail() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.Failure, _i8.TvDetail>> execute(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, _i8.TvDetail>>.value(
            _FakeEither_0<_i6.Failure, _i8.TvDetail>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i8.TvDetail>>);
}

/// A class which mocks [SaveTvWatchlist].
///
/// See the documentation for Mockito's code generation for more information.
class MockSaveTvWatchlist extends _i1.Mock implements _i10.SaveTvWatchlist {
  MockSaveTvWatchlist() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.TvRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvRepository_1(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i3.TvRepository);

  @override
  _i5.Future<_i2.Either<_i6.Failure, String>> execute(_i8.TvDetail? tv) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [tv],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, String>>.value(
            _FakeEither_0<_i6.Failure, String>(
          this,
          Invocation.method(
            #execute,
            [tv],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, String>>);
}

/// A class which mocks [RemoveTvWatchlist].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoveTvWatchlist extends _i1.Mock implements _i11.RemoveTvWatchlist {
  MockRemoveTvWatchlist() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.Failure, String>> execute(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, String>>.value(
            _FakeEither_0<_i6.Failure, String>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, String>>);
}

/// A class which mocks [GetTvWatchList].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTvWatchList extends _i1.Mock implements _i12.GetTvWatchList {
  MockGetTvWatchList() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>>.value(
            _FakeEither_0<_i6.Failure, List<_i7.TV>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>>);
}

/// A class which mocks [isTvInWatchlist].
///
/// See the documentation for Mockito's code generation for more information.
class MockIsTvInWatchlist extends _i1.Mock implements _i13.IsTvInWatchlist {
  MockIsTvInWatchlist() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.Failure, bool>> execute(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, bool>>.value(
            _FakeEither_0<_i6.Failure, bool>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, bool>>);
}

/// A class which mocks [TvRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvRemoteDataSource extends _i1.Mock
    implements _i14.TvRemoteDataSource {
  MockTvRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<List<_i15.TvModel>> getTvList() => (super.noSuchMethod(
        Invocation.method(
          #getTvList,
          [],
        ),
        returnValue: _i5.Future<List<_i15.TvModel>>.value(<_i15.TvModel>[]),
      ) as _i5.Future<List<_i15.TvModel>>);

  @override
  _i5.Future<_i4.TvDetailModel> getTvDetail(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTvDetail,
          [id],
        ),
        returnValue: _i5.Future<_i4.TvDetailModel>.value(_FakeTvDetailModel_2(
          this,
          Invocation.method(
            #getTvDetail,
            [id],
          ),
        )),
      ) as _i5.Future<_i4.TvDetailModel>);

  @override
  _i5.Future<List<_i16.TvSearchResult>> searchTv(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTv,
          [query],
        ),
        returnValue: _i5.Future<List<_i16.TvSearchResult>>.value(
            <_i16.TvSearchResult>[]),
      ) as _i5.Future<List<_i16.TvSearchResult>>);

  @override
  _i5.Future<List<_i17.TvSeriesPopularResult>> getTvPopular() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvPopular,
          [],
        ),
        returnValue: _i5.Future<List<_i17.TvSeriesPopularResult>>.value(
            <_i17.TvSeriesPopularResult>[]),
      ) as _i5.Future<List<_i17.TvSeriesPopularResult>>);

  @override
  _i5.Future<List<_i18.TvTopRatedModelResult>> getTvTopRated() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvTopRated,
          [],
        ),
        returnValue: _i5.Future<List<_i18.TvTopRatedModelResult>>.value(
            <_i18.TvTopRatedModelResult>[]),
      ) as _i5.Future<List<_i18.TvTopRatedModelResult>>);

  @override
  _i5.Future<List<_i19.TvAiringTodayModelResult>> getTvAiringToday() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvAiringToday,
          [],
        ),
        returnValue: _i5.Future<List<_i19.TvAiringTodayModelResult>>.value(
            <_i19.TvAiringTodayModelResult>[]),
      ) as _i5.Future<List<_i19.TvAiringTodayModelResult>>);
}

/// A class which mocks [TvLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvLocalDataSource extends _i1.Mock implements _i20.TvLocalDataSource {
  MockTvLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<String> insertWatchlistTv(_i21.TvTable? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlistTv,
          [movie],
        ),
        returnValue: _i5.Future<String>.value(_i22.dummyValue<String>(
          this,
          Invocation.method(
            #insertWatchlistTv,
            [movie],
          ),
        )),
      ) as _i5.Future<String>);

  @override
  _i5.Future<String> removeWatchlistTv(int? id) => (super.noSuchMethod(
        Invocation.method(
          #removeWatchlistTv,
          [id],
        ),
        returnValue: _i5.Future<String>.value(_i22.dummyValue<String>(
          this,
          Invocation.method(
            #removeWatchlistTv,
            [id],
          ),
        )),
      ) as _i5.Future<String>);

  @override
  _i5.Future<_i21.TvTable?> getTvById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTvById,
          [id],
        ),
        returnValue: _i5.Future<_i21.TvTable?>.value(),
      ) as _i5.Future<_i21.TvTable?>);

  @override
  _i5.Future<List<_i21.TvTable>> getWatchlistTv() => (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTv,
          [],
        ),
        returnValue: _i5.Future<List<_i21.TvTable>>.value(<_i21.TvTable>[]),
      ) as _i5.Future<List<_i21.TvTable>>);

  @override
  _i5.Future<bool> isTvInWatchlist(int? id) => (super.noSuchMethod(
        Invocation.method(
          #IsTvInWatchlist,
          [id],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}