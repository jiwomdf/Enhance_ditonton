import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/presentation/provider/tv_notifier.dart';
import 'package:ditonton/presentation/widgets/tv_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TvSublistPage extends StatefulWidget {
  static const ROUTE_NAME = '/tv_sublist';

  @override
  _TvSublistPageState createState() => _TvSublistPageState();
}

class _TvSublistPageState extends State<TvSublistPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<TvNotifier>(context, listen: false).fetchPopularMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tv Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<TvNotifier>(
          builder: (context, data, child) {
            if (data.state == RequestState.Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.state == RequestState.Loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tv = data.tv[index];
                  return TvCard(TV(
                    adult: tv.adult,
                    backdropPath: tv.backdropPath,
                    genreIds: tv.genreIds,
                    id: tv.id,
                    originCountry: tv.originCountry,
                    originalLanguage: tv.originalLanguage,
                    originalName: tv.originalName,
                    overview: tv.overview,
                    popularity: tv.popularity,
                    posterPath: tv.posterPath,
                    firstAirDate: tv.firstAirDate,
                    name: tv.name,
                    voteAverage: tv.voteAverage,
                    voteCount: tv.voteCount,
                  ));
                },
                itemCount: data.tv.length,
              );
            } else {
              return Center(
                key: Key('error_message'),
                child: Text(data.message),
              );
            }
          },
        ),
      ),
    );
  }
}
