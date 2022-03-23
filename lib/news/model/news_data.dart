import 'package:news_app_demo/news/model/news.dart';

/// Holds the news loaded so far in the app and also the current
/// pagination state.
class NewsData {
  int currentPage;
  List<News> news;

  NewsData({
    required this.currentPage,
    required this.news,
  });

  NewsData copyWith({
    int? currentPage,
    List<News>? news,
  }) {
    return NewsData(
      currentPage: currentPage ?? this.currentPage,
      news: news ?? this.news,
    );
  }
}
