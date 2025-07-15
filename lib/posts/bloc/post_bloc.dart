/*
* Created by Neloy on 12 July, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:practice_bloc_flutter_infinite_list/network/api/call/call_api_post_list.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:practice_bloc_flutter_infinite_list/posts/posts.dart';

import '../../network/configuration/configurations.dart';

part 'post_event.dart';

part 'post_state.dart';

const _postLimit = 20;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PostBloc extends Bloc<PostEvent, PostState> {
  final ConfigurationNetwork _configurationNetwork;

  PostBloc({required ConfigurationNetwork configurationNetwork})
    : _configurationNetwork = configurationNetwork,
      super(const PostState()) {
    on<PostFetched>(
      _onFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onFetched(PostFetched event, Emitter<PostState> emit) async {
    if (state.hasReachedMax) return;

    Map<String, dynamic> data = {
      ConfigurationApiConstant.start: state.posts.length,
      ConfigurationApiConstant.limit: _postLimit,
    };
    Response response = await GetPostList().run(
      data: data,
      configurationNetwork: _configurationNetwork,
    );

    if (response.statusCode == ConfigurationApiConstant.statusCode200OK) {
      final dataList = response.data as List<dynamic>;
      List<PostModel> posts = dataList
          .map((post) => PostModel.fromJson(post as Map<String, dynamic>))
          .toList();

      if (posts.isEmpty) {
        return emit(state.copyWith(hasReachedMax: true));
      }

      emit(
        state.copyWith(
          status: PostStatus.success,
          posts: [...state.posts, ...posts],
        ),
      );
    } else {
      emit(state.copyWith(status: PostStatus.failure));
    }
  }
}
