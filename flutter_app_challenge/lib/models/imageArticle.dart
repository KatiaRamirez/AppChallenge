class ImageArticle {
  final int id;
  final String title;
  final String url;

  ImageArticle({required this.id, required this.title, required this.url});

  factory ImageArticle.fromJson(Map<String, dynamic> json) {
   return ImageArticle(
    id: json['id'],
    title: json['title'],
    url: json['url']
   ); 
  }
}