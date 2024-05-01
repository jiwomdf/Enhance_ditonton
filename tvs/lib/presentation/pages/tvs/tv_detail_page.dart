import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/domain/entities/tv_detail.dart';
import 'package:core/routes.dart';
import 'package:core/styles/colors.dart';
import 'package:core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tvs/presentation/bloc/tv_detail/tv_detail_bloc.dart';
import 'package:tvs/presentation/bloc/tv_recommendation/tv_recommendation_bloc.dart';
import 'package:tvs/presentation/bloc/tv_watch_list/tv_watchlist_bloc.dart';

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
    context.read<TvDetailBloc>().add(GetTvDetailEvent(widget.id));
    context.read<TvWatchlistBloc>().add(IsTvInWatchlistEvent(widget.id));
    context
        .read<TvRecommendationBloc>()
        .add(GetTvRecommendationEvent(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body:
        BlocBuilder<TvWatchlistBloc, TvWatchlistState>(
            builder: (context, state) {
      if (state is TvWatchlistIsAddedWatchlist) {
        if (state.message == TvDetailBloc.watchlistAddSuccessMessage ||
            state.message == TvDetailBloc.watchlistRemoveSuccessMessage) {
          Future(() {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          });
        } else if (state.message.isNotEmpty) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(content: Text(state.message));
              });
        }
        return detailTv(state);
      } else {
        return Container();
      }
    })));
  }

  Widget detailTv(TvWatchlistIsAddedWatchlist watchlistState) {
    return BlocBuilder<TvDetailBloc, TvDetailState>(
      builder: (context, state) {
        if (state is TvDetailLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TvDetailHasData) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Builder(builder: (context) {
                  if (state.result.posterPath.isNotEmpty == true) {
                    return Stack(
                      children: [
                        CachedNetworkImage(
                            height: 350,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                            imageUrl:
                                'https://image.tmdb.org/t/p/w500${state.result.posterPath}',
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error)),
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
                      dataDetail(context, state.result, watchlistState),
                      recommendation()
                    ],
                  ),
                )
              ],
            ),
          );
        } else if (state is TvDetailError) {
          return const Center(child: Text('Empty'));
        } else {
          return Container();
        }
      },
    );
  }

  Widget dataDetail(BuildContext context, TvDetail tvDetail,
      TvWatchlistIsAddedWatchlist state) {
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
                    if (!state.isAddedToWatchlist) {
                      context
                          .read<TvWatchlistBloc>()
                          .add(SaveTvWatchlistEvent(tvDetail));
                    } else {
                      context
                          .read<TvWatchlistBloc>()
                          .add(RemoveTvWatchlistEvent(tvDetail.id));
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      state.isAddedToWatchlist
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
    return BlocBuilder<TvRecommendationBloc, TvRecommendationState>(
      builder: (context, state) {
        if (state is TvRecommendationLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TvRecommendationError) {
          return const Text("Something went wrong");
        } else if (state is TvRecommendationHasData) {
          return SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final tv = state.result[index];
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, Routes.tvDetail,
                          arguments: tv.id);
                    },
                    child: Builder(builder: (context) {
                      if (tv.posterPath.isNotEmpty) {
                        return ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://image.tmdb.org/t/p/w500${tv.posterPath}',
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
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
              itemCount: state.result.length,
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
