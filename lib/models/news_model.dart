class News {
  final String id;
  final String name;
  final String auther;
  final String title;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  News(
      {required this.id,
      required this.name,
      required this.auther,
      required this.title,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});

  factory News.from(Map<String, dynamic> userMap) {
    return News(
        id: userMap["source"]["id"],
        name: userMap["source"]["name"],
        auther: userMap["author"],
        title: userMap["title"],
        url: userMap["url"].toString(),
        urlToImage: userMap["urlToImage"] ?? "",
        publishedAt: userMap["publishedAt"],
        content: userMap["content"] ?? "");
  }
}
