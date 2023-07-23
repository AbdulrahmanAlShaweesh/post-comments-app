// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, must_be_immutable, prefer_final_fields, unused_local_variable, use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:post_commands_app/Models/command_model.dart';
import 'package:post_commands_app/Provider/provider_model.dart';
import 'package:post_commands_app/Services/get_comments_services.dart';
import 'package:post_commands_app/Services/get_post_ervcies.dart';
import 'package:post_commands_app/models/post_model.dart';
import 'package:post_commands_app/screens/comments_screen.dart';
import 'package:post_commands_app/screens/post_screen.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  static String id = 'search screen';
  String? apiName;
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        title: Text(
          'Search by APIs',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: 5),
              child: Text(
                'Enter APIs Name',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: TextFormField(
                controller: _controller,
                onSaved: (data) async {
                  apiName = data;
                },
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () async {
                        if (_controller.text.trim() == 'posts') {
                          PostServices services = PostServices();
                          List<PostModel> posts = await services.getPosts(
                            apiEndpoints: _controller.text.trim(),
                          );
                          Provider.of<PostAndCommentsProvider>(context,
                                  listen: false)
                              .getPost(posts: posts);
                          Navigator.pushNamed(context, PostsScreen.id);
                          log(posts[0].body);
                        } else if (_controller.text.trim() == 'comments') {
                          CommentServices services = CommentServices();
                          List<CommandsModel> comments =
                              await services.GetCommentsServices(
                            apiEndpoints: _controller.text.trim(),
                          );
                          Provider.of<PostAndCommentsProvider>(context,
                                  listen: false)
                              .getComments(comments: comments);
                          Navigator.pushNamed(context, CommentsScreen.id);
                          log(comments[0].body);
                        }
                      },
                      icon: Icon(
                        Icons.search,
                        color: Colors.green.withOpacity(0.5),
                      ),
                    ),
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.green.withOpacity(0.5),
                        width: 1.8,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.green.withOpacity(0.5),
                        width: 1.8,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(15),
                    hintText: 'Enter API endpoints "eg: (posts/commands)"'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
