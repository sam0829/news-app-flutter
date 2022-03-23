import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app_demo/news/ui/news_list_page.dart';
import 'package:news_app_demo/theme/AppTheme.dart';

void main() async {
  await dotenv.load(fileName: 'assets/.dev_env');
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App Demo`',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        cardTheme: AppTheme.getCardTheme(context),
        textTheme: AppTheme.getTextTheme(context),
        fontFamily: AppTheme.fontFamily,
      ),
      home: const NewsListPage(),
    );
  }
}
