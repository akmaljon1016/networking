import 'dart:convert';

import 'package:http/http.dart';

import '../model/post.dart';

class Network {
  Future<List<Post>> getPosts() async {
    var url = "https://jsonplaceholder.typicode.com/posts";
    final response = await get(Uri.parse(url));
    //final response = await get(Uri.http(url, 'posts'));
    if (response.statusCode == 200) {
      return postFromJson(response.body);
    } else {
      throw Exception("Error");
    }
  }

  void postData() async {
    try {
      var url = "https://jsonplaceholder.typicode.com/posts";
          var postItem=Post.second(userId: 1,title: "Akmaljon",body: "Salom hammaga");
      var response = await post(Uri.parse(url),
          body:postItem.toJsonPost());
      print(response.body);
    } catch (e) {
      print(e);
    }
  }
}
