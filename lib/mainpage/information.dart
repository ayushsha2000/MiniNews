class News {
  String id;
  String url;
  String title;
  String text;
  String publisher;
  String author;
  String image;
  String date;

  News(
      {this.id,
      this.url,
      this.title,
      this.text,
      this.publisher,
      this.author,
      this.image,
      this.date});

  News.fromJson(Map<String, dynamic> json) {
    //id = json['articles']['source']['id'];
    url = json['url'];
    title = json['title'];
    text = json['description'];
    //publisher = json['publisher'];
    author = json['author'];
    image = json['urlToImage'];
    date = json['publishedAt'];
  }
}
