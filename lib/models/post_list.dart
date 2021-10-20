import './post.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/* Provider */
final StateNotifierProvider<PostList, dynamic> postListProvider =
  StateNotifierProvider((ref) =>  PostList([]));

class PostList extends StateNotifier<List<Post>> {
  PostList(List<Post> initialPost) : super(initialPost ?? []);

  void addPost(String title) {
    state = [...state, Post(title: title)];
  }

  void deletePost(Post target) {
    state = state.where((task) => task.id != target.id).toList();
  }
}