import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:testapp/models/posts_model.dart';

class PostService {
  Future<List<Posts>> getPost() async {
    List<Posts> postsList = [];
    try {
      var response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts');
      var data = response.data;
      data.forEach((element) {
        Posts posts = Posts.fromJson(element);
        postsList.add(posts);
      });
    } catch (e) {
      log(e.toString());
    }
    return postsList;
  }
}
