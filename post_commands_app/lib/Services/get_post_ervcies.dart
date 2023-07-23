// ignore_for_file: unused_local_variable, unused_import

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:post_commands_app/Models/command_model.dart';
import 'package:post_commands_app/models/post_model.dart';

class PostServices {
  Future<List<PostModel>> getPosts({required String apiEndpoints}) async {
    http.Response response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/$apiEndpoints'),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<PostModel> posts = [];
      List<CommandsModel> commands = [];

      for (int i = 0; i < data.length; i++) {
        posts.add(
          PostModel.fromJson(
            data[i],
          ),
        );
      }
      return posts;
    } else {
      throw Exception('there wear an error occurs ${response.statusCode}');
    }
  }
}
