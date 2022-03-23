import 'package:flutter/material.dart';
import 'package:news_app_demo/base/base_bloc.dart';
import 'package:news_app_demo/base/base_state.dart';
import 'package:news_app_demo/news/bloc/news_list_bloc.dart';
import 'package:news_app_demo/news/di/news_module.dart';
import 'package:news_app_demo/news/model/news_data.dart';
import 'package:news_app_demo/news/state/news_list_state.dart';
import 'package:news_app_demo/news/ui/news_list_item_widget.dart';
import 'package:news_app_demo/route/route_utils.dart';

class NewsListPage extends StatefulWidget {
  const NewsListPage({Key? key}) : super(key: key);

  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends BaseState<NewsListPage> {
  late NewsListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = NewsModule().getNewsListBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Top News',
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: StreamBuilder<NewsListState>(
            stream: _bloc.newsListStateStream,
            builder: (context, snapshot) {
              final state = snapshot.data;

              if (state == null ||
                  (state is NewsListLoadingState && state.isInitialLoading)) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is NewsListLoadingErrorState) {
                return Center(
                  child: Text(
                    state.error?.toString() ?? 'Something went wrong...',
                  ),
                );
              }

              return StreamBuilder<NewsData>(
                  stream: _bloc.newsDataStream,
                  initialData: _bloc.newsDataStream.valueOrNull,
                  builder: (context, snapshot) {
                    final data = snapshot.data;

                    if (data == null) {
                      return Container();
                    }

                    final news = data.news;

                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return NewsListItemWidget(
                          news: news[index],
                          onNewsTapped: (news) {
                            RouteUtils.navigateToNewsDetails(context, news);
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 8,
                        );
                      },
                      itemCount: news.length,
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                    );
                  });
            }),
      ),
    );
  }

  @override
  BaseBloc? getBaseBloc() {
    return _bloc;
  }
}
