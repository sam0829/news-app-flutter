import 'package:flutter/material.dart';
import 'package:news_app_demo/news/model/news.dart';
import 'package:news_app_demo/utils/date_utils.dart' as du;
import 'package:news_app_demo/widget/custom_image.dart';

typedef OnNewsTapped = void Function(News news);

class NewsListItemWidget extends StatelessWidget {
  final News news;
  final OnNewsTapped? onNewsTapped;

  const NewsListItemWidget({
    Key? key,
    required this.news,
    this.onNewsTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onNewsTapped?.call(news);
      },
      child: Card(
        elevation: 3,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// News Image
            Hero(
              tag: news.urlToImage ?? news.url,
              child: CustomImage(
                imageUrl: news.urlToImage ?? '',
                height: 150,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  Text(
                    news.title,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),

                  /// Description
                  Text(
                    news.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Source
                      _NewsListItemMetaDataWidget(
                        icon: Icons.my_library_books,
                        text: news.source ?? 'N/A',
                      ),

                      /// Date
                      _NewsListItemMetaDataWidget(
                        icon: Icons.date_range,
                        text: du.DateUtils.formatDate(
                          news.publishedAt ?? DateTime.now(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NewsListItemMetaDataWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const _NewsListItemMetaDataWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black54,
          ),
        )
      ],
    );
  }
}
