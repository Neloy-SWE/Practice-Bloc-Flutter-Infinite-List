/*
* Created by Neloy on 12 July, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

part of 'post_bloc.dart';

enum PostStatus { initial, success, failure }

final class PostState extends Equatable {
  const PostState({
    this.status = PostStatus.initial,
    this.posts = const <PostModel>[],
    this.hasReachedMax = false,
  });

  final PostStatus status;
  final List<PostModel> posts;
  final bool hasReachedMax;

  PostState copyWith({
    PostStatus? status,
    List<PostModel>? posts,
    bool? hasReachedMax,
  }) {
    return PostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $hasReachedMax, posts: ${posts.length} }''';
  }

  @override
  List<Object?> get props => [status, posts, hasReachedMax];
}
