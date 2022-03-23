import 'package:dio/dio.dart';
import 'package:news_app_demo/rest/rest_client.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Rest client which deals with https://newsapi.org
class NewsApiRestClient extends RestClient {
  NewsApiRestClient()
      : super(
          baseUrl: 'https://newsapi.org/v2',
          interceptor: NewsApiInterceptor(),
        );
}

class NewsApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // append the `apiKey` to every request
    options.queryParameters['apiKey'] = dotenv.env['API_KEY'];
    return handler.next(options);
  }
}
