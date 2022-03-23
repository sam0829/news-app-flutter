import 'package:news_app_demo/base/base_mapper.dart';
import 'package:news_app_demo/news/mapper/news_remote_entity_to_news_mapper.dart';
import 'package:news_app_demo/news/model/entity/news_remote_entity.dart';
import 'package:news_app_demo/news/model/news.dart';
import 'package:news_app_demo/news/model/news_data.dart';
import 'package:news_app_demo/news/model/response/get_news_response.dart';

/// Maps [GetNewsResponse] to [NewsData]
class GetNewsResponseToNewsDataMapper
    extends BaseMapper<GetNewsResponse, NewsData> {
  final _newsRemoteEntityToNewsMapper = NewsRemoteEntityToNewsMapper();

  @override
  NewsData map(GetNewsResponse t) {
    return NewsData(
      news: t.news?.map((e) => _newsRemoteEntityToNewsMapper.map(e)).toList() ??
          <News>[],
      currentPage: t.currentPage,
    );
  }

  @override
  GetNewsResponse reverseMap(NewsData v) {
    // We don't need it ATM so we are skipping this.
    throw UnimplementedError();
  }
}
