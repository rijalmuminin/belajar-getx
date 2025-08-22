import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:belajar_getx/app/modules/posts/controllers/posts_controller.dart';
import 'package:belajar_getx/app/modules/posts/views/posts_detail_view.dart';

class PostView extends StatelessWidget {
  final PostController controller = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Posts (GetX + GetConnect)")),
      body: Obx((){
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (controller.posts.isEmpty) {
          return Center(child: Text("No posts available"));
        }
        return ListView.builder(
          itemCount: controller.posts.length,
          itemBuilder: (context, index) {
            final post = controller.posts[index];
            return Card(
              margin: EdgeInsets.all(8),
              child: ListTile(
                title: Text(post.title),
                subtitle: Text(
                  post.body,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap:() {
                  // pindah ke detail view
                  Get.to(() => PostDetailView(post: post));
                },
              ),
            );
          },
        );
      }),
    );
  }
}