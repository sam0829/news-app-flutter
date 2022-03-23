import 'package:news_app_demo/di/app_module.dart';
import 'package:news_app_demo/news/bloc/news_list_bloc.dart';
import 'package:news_app_demo/news/mapper/get_news_response_to_news_data_mapper.dart';
import 'package:news_app_demo/news/repo/news_repo.dart';
import 'package:news_app_demo/news/source/news_remote_source.dart';

/// Provides repository, BLoC(s), mappers etc to the app related to News Module
class NewsModule {
  static final NewsModule _instance = NewsModule._internal();

  NewsModule._internal();

  factory NewsModule() {
    return _instance;
  }

  NewsListBloc getNewsListBloc() {
    return NewsListBloc(getNewsRepo());
  }

  NewsRepo getNewsRepo() {
    return NewsRepo(_getNewsRemoteSource());
  }

  NewsRemoteSource _getNewsRemoteSource() {
    return NewsRemoteSource(
        AppModule().getNewsApiRestClient(), getNewsResponseToNewsDataMapper());
  }

  GetNewsResponseToNewsDataMapper getNewsResponseToNewsDataMapper() {
    return GetNewsResponseToNewsDataMapper();
  }
}
