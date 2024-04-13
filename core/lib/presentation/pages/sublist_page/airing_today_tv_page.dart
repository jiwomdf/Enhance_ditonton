import 'package:core/presentation/provider/airing_today_notifier.dart';
import 'package:core/presentation/widgets/tv_card.dart';
import 'package:core/utils/state_enum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AiringTodayTVPage extends StatefulWidget {
  static const routeName = '/airing-today-tv';

  const AiringTodayTVPage({super.key});

  @override
  _AiringTodayTVPageState createState() => _AiringTodayTVPageState();
}

class _AiringTodayTVPageState extends State<AiringTodayTVPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<TvAiringTodayNotifier>(context, listen: false)
            .fetchAiringTodayTv());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Airing Today TV'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<TvAiringTodayNotifier>(
          builder: (context, data, child) {
            if (data.state == RequestState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.state == RequestState.loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tv = data.tv[index];
                  return TvCard(tv);
                },
                itemCount: data.tv.length,
              );
            } else {
              return Center(
                key: const Key('error_message'),
                child: Text(data.message),
              );
            }
          },
        ),
      ),
    );
  }
}
