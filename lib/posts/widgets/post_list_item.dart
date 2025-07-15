/*
* Created by Neloy on 12 July, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:flutter/material.dart';
import 'package:practice_bloc_flutter_infinite_list/posts/models/model_post.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({super.key, required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: Text("${post.id}", style: textTheme.bodySmall,),
      title: Text(post.title),
      isThreeLine: true,
      subtitle: Text(post.body),
      dense: true,
    );
  }
}
