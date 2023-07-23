// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:post_commands_app/Provider/provider_model.dart';
import 'package:post_commands_app/screens/comments_screen.dart';
import 'package:post_commands_app/screens/search_screen.dart';

import 'screens/post_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostAndCommentsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          SearchScreen.id: (context) => SearchScreen(),
          PostsScreen.id: (context) => PostsScreen(),
          CommentsScreen.id: (context) => CommentsScreen(),
        },
        initialRoute: PostsScreen.id,
      ),
    );
  }
}
