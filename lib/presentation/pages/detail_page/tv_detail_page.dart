import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/constans.dart';
import 'package:ditonton/domain/entities/tv_detail.dart';
import 'package:ditonton/presentation/provider/movie_detail_notifier.dart';
import 'package:ditonton/presentation/provider/tv_detail_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TvDetailPage extends StatefulWidget {
  static const ROUTE_NAME = '/detail_tv';

  final int id;

  TvDetailPage({required this.id});

  @override
  State<TvDetailPage> createState() => _TvDetailPageState();
}

class _TvDetailPageState extends State<TvDetailPage> {
  final bool _isAddedWatchlist = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<TvDetailNotifier>(context, listen: false)
        ..fetchTvDetail(widget.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<TvDetailNotifier>(
          builder: (context, provider, child) {
            final tvDetail = provider.tvDetail;
            final state = provider.state;
            if (state == RequestState.Loading) {
              return Center(child: CircularProgressIndicator());
            } else if (state == RequestState.Error) {
              return Text(provider.message);
            } else if (state == RequestState.Error) {
              return Center(child: Text('Empty'));
            } else if (state == RequestState.Loaded) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CachedNetworkImage(
                          height: 350,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                          imageUrl:
                              'https://image.tmdb.org/t/p/w500${tvDetail?.posterPath ?? ''}',
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            foregroundColor: Colors.deepPurple,
                            child: IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: dataDetail(context, tvDetail!),
                    )
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget dataDetail(BuildContext context, TvDetail tvDetail) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Flexible(child: Text(tvDetail.title, style: headlineSmall)),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.deepPurple)),
                  onPressed: () async {
                    final notifier = Provider.of<MovieDetailNotifier>(context,
                        listen: false);
                    if (!_isAddedWatchlist) {
                      await notifier
                          .addWatchlist(tvDetail.convertToMovieDetail());
                    } else {
                      await notifier
                          .removeFromWatchlist(tvDetail.convertToMovieDetail());
                    }

                    final message = notifier.watchlistMessage;
                    if (message ==
                            MovieDetailNotifier.watchlistAddSuccessMessage ||
                        message ==
                            MovieDetailNotifier.watchlistRemoveSuccessMessage) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(message)));
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(content: Text(message));
                          });
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _isAddedWatchlist ? Icon(Icons.check) : Icon(Icons.add),
                      Text('Watchlist'),
                    ],
                  ),
                ),
              ]),
              Text(_showDuration(tvDetail.runtime)),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text('Overview', style: titleLarge),
              ),
              Text(tvDetail.overview),
              SizedBox(height: 16)
            ],
          ),
        ),
      ],
    );
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;
    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}
