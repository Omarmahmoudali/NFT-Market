import 'package:flutter/material.dart';
import 'package:testapp/models/posts_model.dart';
import 'package:testapp/service/posts_service.dart';

class PostsListScreen extends StatefulWidget {
  const PostsListScreen({Key? key}) : super(key: key);

  @override
  State<PostsListScreen> createState() => _PostsListScreenState();
}

class _PostsListScreenState extends State<PostsListScreen> {
  List<Posts> postsList = [];
  bool loading = true;

  getPost() async {
    postsList = await PostService().getPost();
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: postsList.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  title: Text(postsList[index].title ?? ''),
                );
              })),
    );
  }
}
