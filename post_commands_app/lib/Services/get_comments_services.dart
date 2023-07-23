// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:post_commands_app/Models/command_model.dart';

class CommentServices {
  Future<List<CommandsModel>> GetCommentsServices(
      {required String apiEndpoints}) async {
    http.Response response = await http.get(
      Uri.parse(
        'https://jsonplaceholder.typicode.com/$apiEndpoints',
      ),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      List<CommandsModel> comments = [];

      for (int i = 0; i < data.length; i++) {
        comments.add(CommandsModel.fromJson(data[i]));
      }
      return comments;
    } else {
      throw Exception(
        'there wear an error occurs ${response.statusCode}',
      );
    }
  }
}
