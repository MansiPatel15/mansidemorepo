class NewsResponse {
  String? title;
  String? link;
  String? dcCreator;
  String? pubDate;
  String? category;
  String? guid;
  String? description;
  String? contentEncoded;

  NewsResponse(
      {this.title,
      this.link,
      this.dcCreator,
      this.pubDate,
      this.category,
      this.guid,
      this.description,
      this.contentEncoded});

  NewsResponse.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    link = json['link'];
    dcCreator = json['dc:creator'];
    pubDate = json['pubDate'];
    category = json['category'];
    guid = json['guid'];
    description = json['description'];
    contentEncoded = json['content:encoded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['link'] = this.link;
    data['dc:creator'] = this.dcCreator;
    data['pubDate'] = this.pubDate;
    data['category'] = this.category;
    data['guid'] = this.guid;
    data['description'] = this.description;
    data['content:encoded'] = this.contentEncoded;
    return data;
  }
}
