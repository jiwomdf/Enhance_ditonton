import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvs/presentation/bloc/tv_popular/tv_popular_bloc.dart';

import '../widgets/tv_card.dart';

class PopularTvPage extends StatefulWidget {
  const PopularTvPage({super.key});

  @override
  _PopularTvPageState createState() => _PopularTvPageState();
}

class _PopularTvPageState extends State<PopularTvPage> {
  @override
  void initState() {
    super.initState();

    context.read<TvPopularBloc>().add(GetTvPopularEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular TV'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TvPopularBloc, TvPopularState>(
          builder: (context, state) {
            if (state is TvPopularLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TvPopularHasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tv = state.result[index];
                  return TvCard(tv);
                },
                itemCount: state.result.length,
              );
            } else if (state is TvPopularError) {
              return Center(
                  key: const Key('error_message'), child: Text(state.message));
            } else {
              return Center(child: Text("Something went wrong"));
            }
          },
        ),
      ),
    );
  }
}
