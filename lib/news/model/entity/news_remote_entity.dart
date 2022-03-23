/// Holds the news json data returned from API
class NewsRemoteEntity {
  String? author;
  String title;
  String description;
  String url;
  String? urlToImage;
  String content;
  String? publishedAt;
  SourceRemoteEntity? source;

  NewsRemoteEntity({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    this.urlToImage,
    required this.content,
    this.publishedAt,
    this.source,
  });

  factory NewsRemoteEntity.fromJson(Map<String, dynamic> map) =>
      NewsRemoteEntity(
        author: map['author'],
        title: map['title'],
        description: map['description'],
        url: map['url'],
        urlToImage: map['urlToImage'],
        content: map['content'],
        publishedAt: map['publishedAt'],
        source: map['source'] != null
            ? SourceRemoteEntity.fromJson(map['source'])
            : null,
      );
}

class SourceRemoteEntity {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  SourceRemoteEntity({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  factory SourceRemoteEntity.fromJson(Map<String, dynamic> map) =>
      SourceRemoteEntity(
        id: map['id'],
        name: map['name'],
        description: map['description'],
        url: map['url'],
        category: map['category'],
        language: map['language'],
        country: map['country'],
      );
}
