import 'package:news_app_demo/base/base_bloc.dart';
import 'package:news_app_demo/news/model/news.dart';
import 'package:news_app_demo/news/state/news_details_state.dart';
import 'package:rxdart/rxdart.dart';

class NewsDetailsBloc extends BaseBloc {
  /// Rx-Stream which holds and notifies about states while fetching
  /// news details
  final newsDetailsStateStream = BehaviorSubject<NewsDetailsState>();

  /// Rx-Stream which holds the [News]
  final newsStream = BehaviorSubject<News>();

  /// For time being, we are passing the [news] from the caller screens
  /// and utilising the same here. In future, we can change this to just
  /// have the id of a news and then fetch the details through the API
  final News _news;

  NewsDetailsBloc(this._news) {
    _observeForNewsDetailsState();
  }

  /// Get the news' details
  void getNewsDetails() {
    subscriptions.add(_getNewsDetails().listen((state) {
      newsDetailsStateStream.add(state);
    }));
  }

  void _observeForNewsDetailsState() {
    subscriptions.add(newsDetailsStateStream.listen((state) {
      if (state is NewsDetailsLoadedState) {
        newsStream.add(state.news);
      }
    }));
  }

  Stream<NewsDetailsState> _getNewsDetails() {
    return Stream.value(NewsDetailsLoadedState(_news));
  }
}
