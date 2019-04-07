class SubscriptionModel {
  final String id;
  final String title;
  final String htmlUrl;
  final String iconUrl;

  SubscriptionModel(this.id, this.title, this.htmlUrl, this.iconUrl);

  SubscriptionModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        htmlUrl = json['htmlUrl'],
        iconUrl = json['iconUrl'];

  Map<String, String> toJson() => {
        'id': id,
        'title': title,
        'htmlUrl': htmlUrl,
        'iconUrl': iconUrl,
      };
}
