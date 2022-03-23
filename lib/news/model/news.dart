/// Represents a news in the app
class News {
  String? source;
  String? author;
  String title;
  String description;
  String url;
  String? urlToImage;
  String content;
  DateTime? publishedAt;

  News({
    this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    this.urlToImage,
    required this.content,
    this.publishedAt,
  });
}
