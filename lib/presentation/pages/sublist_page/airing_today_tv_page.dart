import 'package:core/presentation/provider/airing_today_tv_notifier.dart';
import 'package:core/presentation/provider/top_rated_tv_notifier.dart';
import 'package:core/presentation/widgets/tv_card.dart';
import 'package:core/utils/state_enum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AiringTodayTVPage extends StatefulWidget {
  static const ROUTE_NAME = '/airing-today-tv';

  @override
  _AiringTodayTVPageState createState() => _AiringTodayTVPageState();
}

class _AiringTodayTVPageState extends State<AiringTodayTVPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<AiringTodayTvNotifier>(context, listen: false)
            .fetchAiringTodayTv());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Airing Today TV'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<TopRatedTvNotifier>(
          builder: (context, data, child) {
            if (data.state == RequestState.loading) {
              return Center(
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
