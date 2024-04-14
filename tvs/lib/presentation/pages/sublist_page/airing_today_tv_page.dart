import 'package:core/presentation/bloc/tv_airing_today/tv_airing_today_bloc.dart';
import 'package:core/presentation/widgets/tv_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvAiringTodayPage extends StatefulWidget {
  const TvAiringTodayPage({super.key});

  @override
  _TvAiringTodayPageState createState() => _TvAiringTodayPageState();
}

class _TvAiringTodayPageState extends State<TvAiringTodayPage> {
  @override
  void initState() {
    super.initState();
    context.read<TvAiringTodayBloc>().add(GetTvAiringTodayEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Airing Today TV'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TvAiringTodayBloc, TvAiringTodayState>(
          builder: (context, state) {
            if (state is TvAiringTodayLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is TvAiringTodayHasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tv = state.result[index];
                  return TvCard(tv);
                },
                itemCount: state.result.length,
              );
            } else if (state is TvAiringTodayError) {
              return Center(child: Text(state.message));
            } else {
              return Center(child: Text("Something went wrong"));
            }
          },
        ),
      ),
    );
  }
}
