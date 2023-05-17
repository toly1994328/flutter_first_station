class Article {
  final String title;
  final String url;
  final String time;

  const Article({
    required this.title,
    required this.time,
    required this.url,
  });

  factory Article.formMap(dynamic json) {
    return Article(
      title: json['title'] ?? '未知',
      url: json['link'] ?? '',
      time: json['niceDate'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Article{title: $title, url: $url, time: $time}';
  }
}
