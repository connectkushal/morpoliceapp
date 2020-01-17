class ExternalLinkModel {
  String type;
  String name;
  String url;

  ExternalLinkModel({this.type, this.name, this.url});

  ExternalLinkModel.args(this.name, this.url);

  factory ExternalLinkModel.fromJson(Map<String, dynamic> $data) {
    return ExternalLinkModel(
      type: $data['type'],
      name: $data['name'],
      url: $data['url'],
    );
  }
}
