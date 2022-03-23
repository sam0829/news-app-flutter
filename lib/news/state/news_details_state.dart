import 'package:news_app_demo/news/model/news.dart';

/// Base state for news details page
abstract class NewsDetailsState {}

/// Indicates news details is being fetched
class NewsDetailsLoadingState extends NewsDetailsState {}

/// Indicates news details is loaded
class NewsDetailsLoadedState extends NewsDetailsState {
  News news;

  NewsDetailsLoadedState(this.news);
}

/// Indicates error while loading news details
class NewsDetailsLoadingErrorState extends NewsDetailsState {
  dynamic error;

  NewsDetailsLoadingErrorState(this.error);
}
