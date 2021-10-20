import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
/* components */
import 'package:nostalgic_illusts/components/illust_card.dart';
/*models*/
import '../models/post.dart';
import '../models/post_list.dart';

class HomeScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final postList = useProvider(postListProvider);
    return Container(
      child: ListView.builder(
          itemCount: postList.length,
          itemBuilder: (BuildContext context, int index) {
            final post = postList[index];
            return IllustCard(post);
          }
      ),
    );
  }
}