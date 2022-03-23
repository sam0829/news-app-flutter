import 'package:news_app_demo/rest/news_api_rest_client.dart';
import 'package:news_app_demo/rest/rest_client.dart';

class AppModule {
  static final AppModule _instance = AppModule._internal();

  late RestClient _newsApiRestClient;

  AppModule._internal() {
    _newsApiRestClient = NewsApiRestClient();
  }

  factory AppModule() {
    return _instance;
  }

  RestClient getNewsApiRestClient() {
    return _newsApiRestClient;
  }
}
