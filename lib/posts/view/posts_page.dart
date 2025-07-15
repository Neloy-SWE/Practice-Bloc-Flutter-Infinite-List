/*
* Created by Neloy on 12 July, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_bloc_flutter_infinite_list/network/configuration/configuration_network.dart';
import '../posts.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lazy Loading"),),
      body: BlocProvider(
        create: (_) =>
            PostBloc(configurationNetwork: ConfigurationNetwork())
              ..add(PostFetched()),
        child: const PostList(),
      ),
    );
  }
}
