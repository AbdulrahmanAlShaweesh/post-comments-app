class PostModel {
  int id;
  String title;
  String body;

  PostModel({required this.id, required this.title, required this.body});

  factory PostModel.fromJson(dynamic jsoDdata) {
    return PostModel(
      id: jsoDdata['id'],
      title: jsoDdata['title'],
      body: jsoDdata['body'],
    );
  }
}
