
import 'dart:convert';

import 'package:get/get.dart';
import 'package:getxapi/user/model/post_data.dart';
import 'package:http/http.dart' as http;
class ApiController extends GetxController {
  var posts = <Post>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      posts.value = (jsonDecode(response.body) as List)
          .map((e) => Post.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> addPost(Map<String, dynamic> postData) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(postData),
    );

    if (response.statusCode == 201) {
      final newPost = Post.fromJson(jsonDecode(response.body));
      posts.add(newPost);
    } else {
      throw Exception('Failed to add post');
    }
  }

  Future<void> updatePost(int postId, Map<String, dynamic> updatedData) async {
    final response = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/$postId'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(updatedData),
    );

    if (response.statusCode == 200) {
      final updatedPost = Post.fromJson(jsonDecode(response.body));
      final index = posts.indexWhere((post) => post.id == postId);
      if (index != -1) {
        posts[index] = updatedPost;
      }
    } else {
      throw Exception('Failed to update post');
    }
  }

  Future<void> deletePost(int postId) async {
    final response = await http.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/$postId'),
    );

    if (response.statusCode == 200) {
      posts.removeWhere((post) => post.id == postId);
    } else {
      throw Exception('Failed to delete post');
    }
  }
}
