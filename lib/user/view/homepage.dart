import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxapi/user/Controllers/user_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ApiController apiController = ApiController();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
           // MaterialButton(onPressed: () {},child: Text("Get User"),),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: MaterialButton(onPressed: () {
              apiController.addPost({
                  'title': 'New Post',
                  'body': 'This is the body of the new post',
                  'userId': 1,
                });
              },child: Text("Create User"),color: Colors.red,),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: MaterialButton(onPressed: () {
                if (apiController.posts.isNotEmpty) {
                  final postId = apiController.posts[0].id;
                  apiController.updatePost(postId, {'title': 'Updated Post'});
                }
              },child: Text("Update User"),color: Colors.amber,),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: MaterialButton(onPressed: () {
               if (apiController.posts.isNotEmpty) {
                  final postId = apiController.posts[0].id;
                  apiController.deletePost(postId);
                }
              },child: Text("Remove User"),color: Colors.blue,),
            ),

             Expanded(
              child: Obx(() {
                if (apiController.posts.isEmpty) {
                  return CircularProgressIndicator();
                } else {
                  return ListView.builder(
                    itemCount: apiController.posts.length,
                    itemBuilder: (context, index) {
                      final post = apiController.posts[index];
                      return ListTile(
                        title: Text(post.title),
                        subtitle: Text(post.body),
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
