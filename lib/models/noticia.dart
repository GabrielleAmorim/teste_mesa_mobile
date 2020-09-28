class Noticia {

  String title;
  String description;
  String content;
  String author;
  String published_at;
  bool highlight;
  String url;
  String image_url;
  bool favorite;
  int pageIndex;
  int indiceFavorito;

  Noticia({this.title, this.description, this.content, this.author, this.published_at, this.highlight, this.url, this.image_url,
    this.favorite, this.pageIndex, this.indiceFavorito});

  factory Noticia.fromJson(Map<String, dynamic> json) {
    return Noticia(
        title: json['title'],
        description: json["description"],
        content: json["content"],
        author: json['author'],
        published_at: json['published_at'],
        highlight: json['highlight'],
        url: json['url'],
        image_url: json['image_url'],
        favorite: false
    );
  }

  @override
  bool operator == (Object other) => identical(this, other) || other is Noticia && runtimeType == other.runtimeType && this.title == other.title;


  @override
  String toString() {
    return this.title.toString();
  }

}