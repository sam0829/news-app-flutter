import 'package:flutter/material.dart';
import 'package:news_app_demo/news/model/news.dart';
import 'package:news_app_demo/news/ui/news_details_page.dart';

class RouteUtils {
  static Future navigateToNewsDetails(BuildContext context, News news) {
    return Navigator.push(context,
        MaterialPageRoute(builder: (_) => NewsDetailsPage(news: news)));
  }
}
