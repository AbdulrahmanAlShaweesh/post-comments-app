class CommandsModel {
  int id;
  String name;
  String emial;
  String body;

  CommandsModel({
    required this.id,
    required this.name,
    required this.body,
    required this.emial,
  });

  factory CommandsModel.fromJson(dynamic jsonData) {
    return CommandsModel(
      id: jsonData['id'],
      name: jsonData['name'],
      body: jsonData['body'],
      emial: jsonData['email'],
    );
  }
}
