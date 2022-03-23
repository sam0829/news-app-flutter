import 'package:news_app_demo/base/base_bloc.dart';
import 'package:news_app_demo/news/model/news_data.dart';
import 'package:news_app_demo/news/model/request/get_news_list_request.dart';
import 'package:news_app_demo/news/repo/news_repo.dart';
import 'package:news_app_demo/news/state/news_list_state.dart';
import 'package:rxdart/rxdart.dart';

class NewsListBloc extends BaseBloc {
  /// Rx-Stream which holds and notifies about states while loading news
  final newsListStateStream = BehaviorSubject<NewsListState>();

  /// Rx-Stream which holds and notifies about [NewsData]
  final newsDataStream = BehaviorSubject<NewsData>();

  final NewsRepo _newsRepo;

  NewsListBloc(this._newsRepo) {
    _observeForNewsListState();
    getNews(GetNewsRequest(page: 1));
  }

  /// Get the news for given [request]
  void getNews(GetNewsRequest request) {
    subscriptions.add(_getNews(request).listen((state) {
      newsListStateStream.add(state);
    }, onError: (error) {
      newsListStateStream.add(NewsListLoadingErrorState(error));
    }));
  }

  /// Converts the news grabbing into a stream of [NewsListState]
  Stream<NewsListState> _getNews(GetNewsRequest request) {
    return _newsRepo
        .getNews(request)
        .asStream()
        .map<NewsListState>(
            (data) => NewsListLoadedState(data, request.page == 1))
        .onErrorReturnWith(
            (error, stackTrace) => NewsListLoadingErrorState(error))
        .startWith(NewsListLoadingState(request.page == 1));
  }

  void _observeForNewsListState() {
    subscriptions.add(newsListStateStream.listen((state) {
      if (state is NewsListLoadedState) {
        if (state.isInitialLoading) {
          newsDataStream.add(state.newsData);
        } else {
          // This is paginated data, hence we need to add this
          // data to the existing one
          final existingData = newsDataStream.value;
          final existingNews = existingData.news..addAll(state.newsData.news);
          newsDataStream.add(existingData.copyWith(
            currentPage: state.newsData.currentPage,
            news: existingNews,
          ));
        }
      }
    }));
  }
}
