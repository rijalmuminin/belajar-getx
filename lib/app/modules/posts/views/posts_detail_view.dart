import 'package:flutter/material.dart';
import 'package:belajar_getx/app/data/models/post_model.dart';

class PostDetailView extends StatelessWidget {
  final Post post;

  const PostDetailView({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Post #${post.id}")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Text(
              post.body,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              "User ID: ${post.userId}",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}