import 'package:flutter/material.dart';
import 'package:state_management/model.dart';

class PostDetailsPage extends StatelessWidget {
  final Welcome post;
  const PostDetailsPage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.yellowAccent.shade100,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(post.image),
              SizedBox(height: 10),
              Text(post.title, style: Theme.of(context).textTheme.headline6),
              SizedBox(height: 10),
              Text(post.content),
              SizedBox(height: 10),
              Text('Published on `${post.publishedAt}'),
              Text('Updated on ${post.updatedAt}'),
            ],
          ),
        )
        ),
    );
  }
}

