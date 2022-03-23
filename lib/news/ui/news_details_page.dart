import 'package:flutter/material.dart';
import 'package:news_app_demo/news/model/news.dart';
import 'package:news_app_demo/utils/date_utils.dart' as du;
import 'package:news_app_demo/widget/custom_image.dart';

class NewsDetailsPage extends StatelessWidget {
  /// For time being, the news page is accepting the entire
  /// [news]. However later, only the news' id should be passed
  /// based on which the news details will be fetched.
  final News news;

  const NewsDetailsPage({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// News Image
          Hero(
            tag: news.urlToImage ?? news.url,
            child: CustomImage(
              imageUrl: news.urlToImage ?? "",
              fit: BoxFit.cover,
              height: 250,
              width: double.infinity,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(
                top: 220,
              ),
              padding: const EdgeInsets.all(34),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// News DateTime
                  Text(
                    du.DateUtils.formatDate(news.publishedAt ?? DateTime.now()),
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontSize: 13,
                        ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),

                  /// Title
                  Text(
                    news.title,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),

                  /// Source
                  Row(
                    children: [
                      const Icon(
                        Icons.my_library_books,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        news.source ?? 'N/A',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),

                  /// Description
                  Text(
                    news.description,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontSize: 15,
                        ),
                  )
                ],
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
