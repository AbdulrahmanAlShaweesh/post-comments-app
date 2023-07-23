// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, unused_import, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:post_commands_app/Provider/provider_model.dart';
import 'package:post_commands_app/screens/search_screen.dart';
import 'package:provider/provider.dart';

class PostsScreen extends StatefulWidget {
  PostsScreen({super.key});

  static String id = 'home screen';

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PostAndCommentsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Posts Screen',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black.withOpacity(0.6),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0, top: 10.0),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SearchScreen.id);
              },
              icon: Icon(
                Icons.search,
                size: 28.0,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
        ],
      ),
      body: provider.allPosts != null
          ? ListView.builder(
              itemCount: provider.allPosts!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.5,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Text('${provider.allPosts![index].id}'),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Title :',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Title : ${provider.allPosts![index].title}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(
                                0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Body : ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '${provider.allPosts![index].body}',
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : Container(
              alignment: Alignment.center,
              child: Text(
                'No Posts aviables',
                style: TextStyle(
                  fontSize: 25.0,
                  letterSpacing: 0.8,
                ),
              ),
            ),
    );
  }
}
