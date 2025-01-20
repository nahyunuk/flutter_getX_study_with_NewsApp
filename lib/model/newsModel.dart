class NewsArticle {
  String? author;
  String? title;
  String? description;
  String? urlToImage;
  String? publishedAt;
  String? content;

  NewsArticle(
      {this.author,
      this.title,
      this.description,
      this.urlToImage,
      this.content,
      this.publishedAt});

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      author: json['author'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
      content: json['content'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
    );
  }
}
