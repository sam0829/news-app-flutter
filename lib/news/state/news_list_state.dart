import 'package:news_app_demo/news/model/news_data.dart';

/// Base state for news list page
abstract class NewsListState {}

/// Indicates news list is being fetched
class NewsListLoadingState extends NewsListState {
  /// This is true if the first page is being loaded.
  /// For the sub-sequent pagination, it'll be false
  bool isInitialLoading;

  NewsListLoadingState(this.isInitialLoading);
}

/// Indicates news list is loaded
class NewsListLoadedState extends NewsListState {
  NewsData newsData;
  bool isInitialLoading;

  NewsListLoadedState(this.newsData, this.isInitialLoading);
}

/// Indicates error while loading news
class NewsListLoadingErrorState extends NewsListState {
  dynamic error;

  NewsListLoadingErrorState(this.error);
}
