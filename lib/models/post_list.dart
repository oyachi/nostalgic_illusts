import './post.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:io';

/* Provider */
final StateNotifierProvider<PostList, dynamic> postListProvider =
  StateNotifierProvider((ref) =>  PostList([]));

class PostList extends StateNotifier<List<Post>> {
  PostList(List<Post> initialPost) : super(initialPost ?? []);

  void addPost(String title, String description, String reflection, File image) {
    state = [...state, Post(title: title, description: description, reflection: reflection, image: image)];
  }

  void deletePost(Post target) {
    state = state.where((task) => task.id != target.id).toList();
  }

  void editPost(String title, String description, String reflection, Post target) {
    var targetIndex = state.indexWhere((task) {
      return task.id == target.id;
    });
    state[targetIndex].title = title;
    state[targetIndex].description = description;
    state[targetIndex].reflection = reflection;
  }
}

