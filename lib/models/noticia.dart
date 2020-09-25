class Noticia {

  String title;
  String description;
  String content;
  String author;
  String published_at;
  bool highlight;
  String url;
  String image_url;

  Noticia({this.title, this.description, this.content, this.author, this.published_at, this.highlight, this.url, this.image_url});

  factory Noticia.fromJson(Map<String, dynamic> json) {
    return Noticia(
        title: json['title'],
        description: json["description"],
        content: json["content"],
        author: json['author'],
        published_at: json['published_at'],
        highlight: json['highlight'],
        url: json['url'],
        image_url: json['image_url']
    );
  }


}