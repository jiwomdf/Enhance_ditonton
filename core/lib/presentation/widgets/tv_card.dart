import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/domain/entities/tv.dart';
import 'package:core/presentation/pages/detail_page/tv_detail_page.dart';
import 'package:core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class TvCard extends StatelessWidget {
  final TV tv;

  const TvCard(this.tv, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            TvDetailPage.routeName,
            arguments: tv.id,
          );
        },
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Card(
              child: Container(
                margin: const EdgeInsets.only(
                  left: 16 + 80 + 16,
                  bottom: 8,
                  right: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tv.name ?? '-',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: kHeading6,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      tv.overview ?? '-',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Builder(builder: (context) {
              if (tv.posterPath != null && tv.posterPath!.isNotEmpty) {
                return Container(
                  margin: const EdgeInsets.only(
                    left: 16,
                    bottom: 16,
                  ),
                  child: ClipRRect(
                    child: CachedNetworkImage(
                      imageUrl: '//TODO: jiwo BASE_IMAGE_URL${tv.posterPath}',
                      width: 80,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                );
              } else {
                return Text("Image Empty");
              }
            }),
          ],
        ),
      ),
    );
  }
}