import 'package:flutter/material.dart';
import 'package:post_commands_app/Models/command_model.dart';
import 'package:post_commands_app/models/post_model.dart';

class PostAndCommentsProvider extends ChangeNotifier {
  List<PostModel>? allPosts;
  List<CommandsModel>? allComments;

  List<PostModel>? get post => allPosts;
  List<CommandsModel>? get comments => allComments;

  getPost({required posts}) {
    allPosts = posts;
    notifyListeners();
  }

  getComments({required comments}) {
    allComments = comments;
    notifyListeners();
  }
}
