import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/domain/entities/tv_detail.dart';
import 'package:core/styles/colors.dart';
import 'package:core/styles/text_styles.dart';
import 'package:core/utils/state_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:tvs/presentation/bloc/tv_detail_notifier.dart';

class TvDetailPage extends StatefulWidget {
  final int id;

  const TvDetailPage({super.key, required this.id});

  @override
  State<TvDetailPage> createState() => _TvDetailPageState();
}

class _TvDetailPageState extends State<TvDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<TvDetailNotifier>(context, listen: false)
      ..fetchTvDetail(widget.id)
      ..loadWatchlistStatus(widget.id)
      ..loadRecommendation(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<TvDetailNotifier>(
          builder: (context, provider, child) {
            final tvDetail = provider.tvDetail;
            final state = provider.state;
            if (state == RequestState.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state == RequestState.error) {
              return Text(provider.messageTvDetail);
            } else if (state == RequestState.error) {
              return const Center(child: Text('Empty'));
            } else if (state == RequestState.loaded) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Builder(builder: (context) {
                      if (provider.tvDetail?.posterPath != null &&
                          provider.tvDetail?.posterPath.isNotEmpty == true) {
                        return Stack(
                          children: [
                            CachedNetworkImage(
                              height: 350,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                              imageUrl:
                                  'https://image.tmdb.org/t/p/w500${tvDetail?.posterPath ?? ''}',
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                foregroundColor: Colors.deepPurple,
                                child: IconButton(
                                  icon: const Icon(Icons.arrow_back),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            )
                          ],
                        );
                      } else {
                        return const Text("Image Empty");
                      }
                    }),
                    Container(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Column(
                        children: [
                          dataDetail(context, provider, tvDetail!),
                          recommendation()
                        ],
                      ),
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

  Widget dataDetail(
      BuildContext context, TvDetailNotifier provider, TvDetail tvDetail) {
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
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.deepPurple)),
                  onPressed: () async {
                    final notifier =
                        Provider.of<TvDetailNotifier>(context, listen: false);
                    if (!provider.isAddedToWatchlist) {
                      await notifier.addWatchlist(tvDetail);
                    } else {
                      await notifier.removeFromWatchlist(tvDetail);
                    }

                    if (!context.mounted) return;
                    final message = notifier.watchlistMessage;
                    if (message ==
                            TvDetailNotifier.watchlistAddSuccessMessage ||
                        message ==
                            TvDetailNotifier.watchlistRemoveSuccessMessage) {
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
                      provider.isAddedToWatchlist
                          ? const Icon(Icons.check)
                          : const Icon(Icons.add),
                      const Text('Watchlist')
                    ],
                  ),
                ),
              ]),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rating', style: titleLarge),
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: tvDetail.voteAverage / 2,
                          itemCount: 5,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: kMikadoYellow,
                          ),
                          itemSize: 24,
                        ),
                        Text(tvDetail.voteAverage.toString()),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text('Runtime', style: titleLarge),
              ),
              Text(_showDuration(tvDetail.runtime)),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text('Overview', style: titleLarge),
              ),
              Text(tvDetail.overview),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }

  Widget recommendation() {
    return Consumer<TvDetailNotifier>(
      builder: (context, data, child) {
        if (data.recommendationState == RequestState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (data.recommendationState == RequestState.error) {
          return const Text("Something went wrong");
        } else if (data.recommendationState == RequestState.loaded) {
          return SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final tv = data.tvRecomemendation[index];
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        "TvDetailPage.ROUTE_NAME //TODO: jiwo",
                        arguments: tv.id,
                      );
                    },
                    child: Builder(builder: (context) {
                      if (tv.posterPath.isNotEmpty) {
                        return ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://image.tmdb.org/t/p/w500${tv.posterPath}',
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        );
                      } else {
                        return const Text("Image Empty");
                      }
                    }),
                  ),
                );
              },
              itemCount: data.tvRecomemendation.length,
            ),
          );
        } else {
          return Container();
        }
      },
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
