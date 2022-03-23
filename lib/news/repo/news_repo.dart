import 'package:news_app_demo/news/model/news_data.dart';
import 'package:news_app_demo/news/model/request/get_news_list_request.dart';
import 'package:news_app_demo/news/source/news_remote_source.dart';

class NewsRepo {
  final NewsRemoteSource _newsRemoteSource;

  NewsRepo(this._newsRemoteSource);

  /// Get the news for given [request]
  Future<NewsData> getNews(GetNewsRequest request) {
    return _newsRemoteSource.getNews(request);
  }
}
