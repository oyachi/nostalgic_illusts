import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
/* screens */
import '../screens/edit_screen.dart';
/* models */
import '../models/post_list.dart';
import '../models/post.dart';

class DetailBottomButtons extends StatelessWidget {
  Post post;
  DetailBottomButtons(this.post);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 30.0),
      color: Colors.white,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            Spacer(flex: 1),
            Expanded(
              flex: 3,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                    ),
                    onPressed: () async {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => EditScreen(post)),
                      );
                    },
                    label: Text('Edit', style: TextStyle(color: Colors.white)),
                    icon: Icon(Icons.edit),
                  ),
                ),
              ),
            ),
            Spacer(),
            Expanded(
              flex: 3,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Theme
                          .of(context)
                          .primaryColor),
                    ),
                    onPressed: () => _showDialog(context),
                    label: Text('Delete', style: TextStyle(color: Theme
                        .of(context)
                        .primaryColor)),
                    icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
  Future<void> _showDialog(BuildContext context) async {
    return await showDialog<void>(
      context: context,
      builder: (BuildContext context) =>
          AlertDialog(
            title: const Text("Accept?"),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () => {
                  Navigator.pop(context),
                  Navigator.pop(context),
                  context.read(postListProvider.notifier).deletePost(post),
                },
                child: const Text("OK"),
              ),
            ],
          ),
    );
  }
}