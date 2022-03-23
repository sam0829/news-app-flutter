import 'package:news_app_demo/news/model/entity/news_remote_entity.dart';

class GetNewsResponse {
  List<NewsRemoteEntity>? news;
  int currentPage;

  GetNewsResponse({
    this.news,
    required this.currentPage,
  });

  factory GetNewsResponse.fromJson(Map<String, dynamic> map, int currentPage) {
    final articlesJson = map['articles'];
    final news = <NewsRemoteEntity>[];
    if (articlesJson != null && articlesJson is List) {
      news.addAll(
          articlesJson.map((e) => NewsRemoteEntity.fromJson(e)).toList());
    }
    return GetNewsResponse(
      news: news,
      currentPage: currentPage,
    );
  }
}
