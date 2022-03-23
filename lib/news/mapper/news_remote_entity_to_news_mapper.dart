import 'package:news_app_demo/base/base_mapper.dart';
import 'package:news_app_demo/news/model/entity/news_remote_entity.dart';
import 'package:news_app_demo/news/model/news.dart';

/// Maps [NewsRemoteEntity] to [News]
class NewsRemoteEntityToNewsMapper extends BaseMapper<NewsRemoteEntity, News> {
  @override
  News map(NewsRemoteEntity t) {
    return News(
        source: t.source?.name,
        author: t.author,
        title: t.title,
        description: t.description,
        url: t.url,
        urlToImage: t.urlToImage,
        content: t.content,
        publishedAt: DateTime.tryParse(t.publishedAt ?? ''));
  }

  @override
  NewsRemoteEntity reverseMap(News v) {
    // We don't need it ATM so we are skipping this.
    throw UnimplementedError();
  }
}
