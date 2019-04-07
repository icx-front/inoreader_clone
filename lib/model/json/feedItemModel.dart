class FeedModel {
  String title;
  String id;
  String summary;
  String originTitle;
  String htmlUrl;
  String imageHref; // the origin is a list<Map>

  FeedModel(this.id, this.title, this.summary);

  FeedModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.title = json['title'];
    var _content = json['summary'];
    var _origin = json['origin'];
    var _enclosure = json['enclosure']; // List<Map<String, String>
    _content.forEach((k, v) {
      if (k == 'content') {
        print(v);
        this.summary = v;
      }
    });

    // get htmlUrl and title
    _origin.forEach((k, v) {
      if (k == 'htmlUrl') {
        this.htmlUrl = v;
      }
      if (k == 'title') {
        this.originTitle = v;
      }
    });

    // get enclosure image
    if (_enclosure != null && _enclosure is List) {
      _enclosure.map((item) {
        var _href = item.href;
        if (_href is String) {
          this.imageHref = _href;
        }
      });
    }
  }
}
