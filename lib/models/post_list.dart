import './post.dart';
import 'package:state_notifier/state_notifier.dart';

class PostList extends StateNotifier<List<Post>> {
  PostList(List<Post> initialPost) : super(initialPost ?? []);

  void addPost(String title) {
    state = [...state, Post(title: title)];
  }

  void deletePost(Post target) {
    state = state.where((task) => task.id != target.id).toList();
  }
}