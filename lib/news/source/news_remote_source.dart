import 'package:news_app_demo/news/mapper/get_news_response_to_news_data_mapper.dart';
import 'package:news_app_demo/news/model/news_data.dart';
import 'package:news_app_demo/news/model/request/get_news_list_request.dart';
import 'package:news_app_demo/news/model/response/get_news_response.dart';
import 'package:news_app_demo/news/news_constants.dart';
import 'package:news_app_demo/rest/rest_client.dart';

/// News Source which works with remote server via REST API calls
class NewsRemoteSource {
  final RestClient _restClient;

  final GetNewsResponseToNewsDataMapper _getNewsResponseToNewsDataMapper;

  NewsRemoteSource(this._restClient, this._getNewsResponseToNewsDataMapper);

  /// Get the news data from the remote / server
  Future<NewsData> getNews(GetNewsRequest request) {
    return _restClient.dio().get(NewsConstants.topHeadlines, queryParameters: {
      'page': request.page,
      'pageSize': request.pageSize,
      'country': 'IN',
    }).then((response) {
      return GetNewsResponse.fromJson(response.data, request.page);
    }).then(
        (newsResponse) => _getNewsResponseToNewsDataMapper.map(newsResponse));
  }
}
