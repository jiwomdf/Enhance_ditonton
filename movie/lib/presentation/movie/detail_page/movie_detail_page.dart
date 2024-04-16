import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/domain/entities/movie_detail.dart';
import 'package:core/routes.dart';
import 'package:core/styles/colors.dart';
import 'package:core/styles/text_styles.dart';
import 'package:core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie/presentation/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:movie/presentation/bloc/movie_recommendations/bloc/movie_recommendation_bloc.dart';
import 'package:movie/presentation/bloc/movie_watchlist/movie_watchlist_bloc.dart';

class MovieDetailPage extends StatefulWidget {
  final int id;
  const MovieDetailPage({super.key, required this.id});

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<MovieDetailBloc>().add(GetMovieDetailEvent(widget.id));
    context
        .read<MovieWatchlistBloc>()
        .add(GetMovieWatchlistStatusEvent(widget.id));
    context
        .read<MovieRecommendationBloc>()
        .add(GetMovieRecommendationEvent(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (context, state) {
          if (state is MovieDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieDetailHasData) {
            final movie = state.result;
            return SafeArea(child: DetailContent(movie));
          } else if (state is MovieDetailError) {
            return Text(state.message);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class DetailContent extends StatelessWidget {
  final MovieDetail movie;

  const DetailContent(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: BlocBuilder<MovieWatchlistBloc, MovieWatchlistState>(
              builder: (context, state) {
            if (state is MovieWatchlistIsAddedWatchlist) {
              if (state.message == addedToWatchlist ||
                  state.message == removedFromWatchlist) {
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
              return draggableSheet(state);
            } else {
              return Container();
            }
          }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
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

  Widget draggableSheet(MovieWatchlistIsAddedWatchlist state) {
    return DraggableScrollableSheet(
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: kRichBlack,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: kHeading5,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (!state.isAddedToWatchlist) {
                            context
                                .read<MovieWatchlistBloc>()
                                .add(InsertMovieWatchlistEvent(movie));
                          } else {
                            context
                                .read<MovieWatchlistBloc>()
                                .add(RemoveMovieWatchlistEvent(movie));
                          }
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            state.isAddedToWatchlist
                                ? const Icon(Icons.check)
                                : const Icon(Icons.add),
                            const Text('Watchlist'),
                          ],
                        ),
                      ),
                      Text(_showDuration(movie.runtime)),
                      Row(
                        children: [
                          RatingBarIndicator(
                            rating: movie.voteAverage / 2,
                            itemCount: 5,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: kMikadoYellow,
                            ),
                            itemSize: 24,
                          ),
                          Text('${movie.voteAverage}')
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text('Overview', style: kHeading6),
                      Text(movie.overview),
                      const SizedBox(height: 16),
                      Text('Recommendations', style: kHeading6),
                      recommendationsPage(),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  color: Colors.white,
                  height: 4,
                  width: 48,
                ),
              ),
            ],
          ),
        );
      },
      // initialChildSize: 0.5,
      minChildSize: 0.25,
      // maxChildSize: 1.0,
    );
  }

  Widget recommendationsPage() {
    return BlocBuilder<MovieRecommendationBloc, MovieRecommendationState>(
      builder: (context, state) {
        if (state is MovieRecommendationLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MovieRecommendationError) {
          return Text(state.message);
        } else if (state is MovieRecommendationHasData) {
          return SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final movie = state.result[index];
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.movieDetail,
                        arguments: movie.id,
                      );
                    },
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
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
}
