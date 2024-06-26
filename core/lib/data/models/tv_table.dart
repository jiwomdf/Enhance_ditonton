import 'package:core/domain/entities/tv.dart';
import 'package:core/domain/entities/tv_detail.dart';
import 'package:equatable/equatable.dart';

class TvTable extends Equatable {
  final int id;
  final String? title;
  final String? posterPath;
  final String? overview;

  const TvTable({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
  });

  factory TvTable.fromEntity(TvDetail movie) => TvTable(
        id: movie.id,
        title: movie.title,
        posterPath: movie.posterPath,
        overview: movie.overview,
      );

  factory TvTable.fromMap(Map<String, dynamic> map) => TvTable(
        id: map['id'],
        title: map['title'],
        posterPath: map['posterPath'],
        overview: map['overview'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'posterPath': posterPath,
        'overview': overview,
      };

  TV toEntity() => TV.watchlist(
        id: id,
        overview: overview ?? '',
        posterPath: posterPath ?? '',
        name: title ?? '',
      );

  @override
  List<Object?> get props => [id, title, posterPath, overview];
}
