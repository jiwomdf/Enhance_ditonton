// Mocks generated by Mockito 5.4.4 from annotations
// in ditonton/test/helpers/test_helper_tv.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:convert' as _i27;
import 'dart:typed_data' as _i28;

import 'package:dartz/dartz.dart' as _i2;
import 'package:ditonton/common/failure.dart' as _i7;
import 'package:ditonton/data/datasources/tv_local_data_source.dart' as _i23;
import 'package:ditonton/data/datasources/tv_remote_data_source.dart' as _i16;
import 'package:ditonton/data/models/tv_airing_today_model.dart' as _i21;
import 'package:ditonton/data/models/tv_detail_model.dart' as _i4;
import 'package:ditonton/data/models/tv_list_model.dart' as _i17;
import 'package:ditonton/data/models/tv_popular_model.dart' as _i19;
import 'package:ditonton/data/models/tv_recommendation_dart.dart' as _i22;
import 'package:ditonton/data/models/tv_search_model.dart' as _i18;
import 'package:ditonton/data/models/tv_table.dart' as _i24;
import 'package:ditonton/data/models/tv_toprated_model.dart' as _i20;
import 'package:ditonton/domain/entities/tv.dart' as _i8;
import 'package:ditonton/domain/entities/tv_detail.dart' as _i9;
import 'package:ditonton/domain/entities/tv_recommendation.dart' as _i10;
import 'package:ditonton/domain/repositories/tv_repository.dart' as _i3;
import 'package:ditonton/domain/usecases/tv/get_tv_detail.dart' as _i11;
import 'package:ditonton/domain/usecases/tv/get_tv_recommendation.dart' as _i26;
import 'package:ditonton/domain/usecases/tv/get_tv_watchlist.dart' as _i14;
import 'package:ditonton/domain/usecases/tv/is_tv_in_watchlist.dart' as _i15;
import 'package:ditonton/domain/usecases/tv/remove_tv_watchlist.dart' as _i13;
import 'package:ditonton/domain/usecases/tv/save_tv_watchlist.dart' as _i12;
import 'package:http/http.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i25;

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

class _FakeResponse_3 extends _i1.SmartFake implements _i5.Response {
  _FakeResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_4 extends _i1.SmartFake
    implements _i5.StreamedResponse {
  _FakeStreamedResponse_4(
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
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>> getTvList() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvList,
          [],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.TV>>(
          this,
          Invocation.method(
            #getTvList,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, _i9.TvDetail>> getTvDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvDetail,
          [id],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, _i9.TvDetail>>.value(
            _FakeEither_0<_i7.Failure, _i9.TvDetail>(
          this,
          Invocation.method(
            #getTvDetail,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i9.TvDetail>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> saveWatchlistTv(
          _i9.TvDetail? tv) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveWatchlistTv,
          [tv],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, String>>.value(
            _FakeEither_0<_i7.Failure, String>(
          this,
          Invocation.method(
            #saveWatchlistTv,
            [tv],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, String>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> removeWatchlistTv(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlistTv,
          [id],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, String>>.value(
            _FakeEither_0<_i7.Failure, String>(
          this,
          Invocation.method(
            #removeWatchlistTv,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, String>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>> getWatchlistTv() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTv,
          [],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.TV>>(
          this,
          Invocation.method(
            #getWatchlistTv,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, bool>> isTvInWatchlist(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #isTvInWatchlist,
          [id],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, bool>>.value(
            _FakeEither_0<_i7.Failure, bool>(
          this,
          Invocation.method(
            #isTvInWatchlist,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, bool>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>> searchTv(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTv,
          [query],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.TV>>(
          this,
          Invocation.method(
            #searchTv,
            [query],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>> getTvListPopular() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvListPopular,
          [],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.TV>>(
          this,
          Invocation.method(
            #getTvListPopular,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>> getTvListTopRated() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvListTopRated,
          [],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.TV>>(
          this,
          Invocation.method(
            #getTvListTopRated,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>> getTvListAiringToday() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvListAiringToday,
          [],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.TV>>(
          this,
          Invocation.method(
            #getTvListAiringToday,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>);

  @override
  _i6.Future<
      _i2.Either<_i7.Failure, List<_i10.TvRecomemendation>>> getTvRecomendation(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvRecomendation,
          [id],
        ),
        returnValue: _i6.Future<
                _i2.Either<_i7.Failure, List<_i10.TvRecomemendation>>>.value(
            _FakeEither_0<_i7.Failure, List<_i10.TvRecomemendation>>(
          this,
          Invocation.method(
            #getTvRecomendation,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i10.TvRecomemendation>>>);
}

/// A class which mocks [GetTvDetail].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTvDetail extends _i1.Mock implements _i11.GetTvDetail {
  MockGetTvDetail() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, _i9.TvDetail>> execute(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, _i9.TvDetail>>.value(
            _FakeEither_0<_i7.Failure, _i9.TvDetail>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i9.TvDetail>>);
}

/// A class which mocks [SaveTvWatchlist].
///
/// See the documentation for Mockito's code generation for more information.
class MockSaveTvWatchlist extends _i1.Mock implements _i12.SaveTvWatchlist {
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
  _i6.Future<_i2.Either<_i7.Failure, String>> execute(_i9.TvDetail? tv) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [tv],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, String>>.value(
            _FakeEither_0<_i7.Failure, String>(
          this,
          Invocation.method(
            #execute,
            [tv],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, String>>);
}

/// A class which mocks [RemoveTvWatchlist].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoveTvWatchlist extends _i1.Mock implements _i13.RemoveTvWatchlist {
  MockRemoveTvWatchlist() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> execute(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, String>>.value(
            _FakeEither_0<_i7.Failure, String>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, String>>);
}

/// A class which mocks [GetTvWatchList].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTvWatchList extends _i1.Mock implements _i14.GetTvWatchList {
  MockGetTvWatchList() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.TV>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>);
}

/// A class which mocks [IsTvInWatchlist].
///
/// See the documentation for Mockito's code generation for more information.
class MockIsTvInWatchlist extends _i1.Mock implements _i15.IsTvInWatchlist {
  MockIsTvInWatchlist() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, bool>> execute(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, bool>>.value(
            _FakeEither_0<_i7.Failure, bool>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, bool>>);
}

/// A class which mocks [TvRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvRemoteDataSource extends _i1.Mock
    implements _i16.TvRemoteDataSource {
  MockTvRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<List<_i17.TvModel>> getTvList() => (super.noSuchMethod(
        Invocation.method(
          #getTvList,
          [],
        ),
        returnValue: _i6.Future<List<_i17.TvModel>>.value(<_i17.TvModel>[]),
      ) as _i6.Future<List<_i17.TvModel>>);

  @override
  _i6.Future<_i4.TvDetailModel> getTvDetail(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTvDetail,
          [id],
        ),
        returnValue: _i6.Future<_i4.TvDetailModel>.value(_FakeTvDetailModel_2(
          this,
          Invocation.method(
            #getTvDetail,
            [id],
          ),
        )),
      ) as _i6.Future<_i4.TvDetailModel>);

  @override
  _i6.Future<List<_i18.TvSearchResult>> searchTv(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTv,
          [query],
        ),
        returnValue: _i6.Future<List<_i18.TvSearchResult>>.value(
            <_i18.TvSearchResult>[]),
      ) as _i6.Future<List<_i18.TvSearchResult>>);

  @override
  _i6.Future<List<_i19.TvSeriesPopularResult>> getTvPopular() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvPopular,
          [],
        ),
        returnValue: _i6.Future<List<_i19.TvSeriesPopularResult>>.value(
            <_i19.TvSeriesPopularResult>[]),
      ) as _i6.Future<List<_i19.TvSeriesPopularResult>>);

  @override
  _i6.Future<List<_i20.TvTopRatedModelResult>> getTvTopRated() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvTopRated,
          [],
        ),
        returnValue: _i6.Future<List<_i20.TvTopRatedModelResult>>.value(
            <_i20.TvTopRatedModelResult>[]),
      ) as _i6.Future<List<_i20.TvTopRatedModelResult>>);

  @override
  _i6.Future<List<_i21.TvAiringTodayModelResult>> getTvAiringToday() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvAiringToday,
          [],
        ),
        returnValue: _i6.Future<List<_i21.TvAiringTodayModelResult>>.value(
            <_i21.TvAiringTodayModelResult>[]),
      ) as _i6.Future<List<_i21.TvAiringTodayModelResult>>);

  @override
  _i6.Future<List<_i22.TvRecommendationResult>> getTvRecomendation(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvRecomendation,
          [id],
        ),
        returnValue: _i6.Future<List<_i22.TvRecommendationResult>>.value(
            <_i22.TvRecommendationResult>[]),
      ) as _i6.Future<List<_i22.TvRecommendationResult>>);
}

/// A class which mocks [TvLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvLocalDataSource extends _i1.Mock implements _i23.TvLocalDataSource {
  MockTvLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<String> insertWatchlistTv(_i24.TvTable? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlistTv,
          [movie],
        ),
        returnValue: _i6.Future<String>.value(_i25.dummyValue<String>(
          this,
          Invocation.method(
            #insertWatchlistTv,
            [movie],
          ),
        )),
      ) as _i6.Future<String>);

  @override
  _i6.Future<String> removeWatchlistTv(int? id) => (super.noSuchMethod(
        Invocation.method(
          #removeWatchlistTv,
          [id],
        ),
        returnValue: _i6.Future<String>.value(_i25.dummyValue<String>(
          this,
          Invocation.method(
            #removeWatchlistTv,
            [id],
          ),
        )),
      ) as _i6.Future<String>);

  @override
  _i6.Future<_i24.TvTable?> getTvById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTvById,
          [id],
        ),
        returnValue: _i6.Future<_i24.TvTable?>.value(),
      ) as _i6.Future<_i24.TvTable?>);

  @override
  _i6.Future<List<_i24.TvTable>> getWatchlistTv() => (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTv,
          [],
        ),
        returnValue: _i6.Future<List<_i24.TvTable>>.value(<_i24.TvTable>[]),
      ) as _i6.Future<List<_i24.TvTable>>);

  @override
  _i6.Future<bool> isTvInWatchlist(int? id) => (super.noSuchMethod(
        Invocation.method(
          #isTvInWatchlist,
          [id],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
}

/// A class which mocks [GetTvRecomendation].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTvRecomendation extends _i1.Mock
    implements _i26.GetTvRecomendation {
  MockGetTvRecomendation() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i10.TvRecomemendation>>> execute(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue: _i6.Future<
                _i2.Either<_i7.Failure, List<_i10.TvRecomemendation>>>.value(
            _FakeEither_0<_i7.Failure, List<_i10.TvRecomemendation>>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i10.TvRecomemendation>>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i5.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i5.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<_i5.Response>);

  @override
  _i6.Future<_i5.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<_i5.Response>);

  @override
  _i6.Future<_i5.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i27.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i5.Response>);

  @override
  _i6.Future<_i5.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i27.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i5.Response>);

  @override
  _i6.Future<_i5.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i27.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i5.Response>);

  @override
  _i6.Future<_i5.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i27.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i5.Response>);

  @override
  _i6.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<String>.value(_i25.dummyValue<String>(
          this,
          Invocation.method(
            #read,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<String>);

  @override
  _i6.Future<_i28.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i28.Uint8List>.value(_i28.Uint8List(0)),
      ) as _i6.Future<_i28.Uint8List>);

  @override
  _i6.Future<_i5.StreamedResponse> send(_i5.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i6.Future<_i5.StreamedResponse>.value(_FakeStreamedResponse_4(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i6.Future<_i5.StreamedResponse>);

  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
