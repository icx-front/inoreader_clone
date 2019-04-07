class FeedModel {
  String title;
  String id;
  String summary;

  FeedModel(this.id, this.title, this.summary);

//  FeedModel.fromJson(Map<String, dynamic> json)
//      : title = json['title'],
//        id = json['id'],
//        summary = _getContent(json['summary']);
//
  FeedModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.title = json['title'];
    var _content = json['summary'];
    _content.forEach((k, v) {
      if (k == 'content') {
        print(v);
        this.summary = v;
      }
    });
  }
}
