import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
/* screens */
import '../screens/detail_screen.dart';
/* models */
import '../models/post.dart';

class IllustCard extends StatelessWidget {
  @override
  final Post post;
  IllustCard(this.post);
  Widget build(BuildContext context) {
    return OpenContainer(
      openBuilder:(context,_)=>DetailScreen(post),
      closedBuilder:
          (context,openContainer)=> GestureDetector(
            onTap: () {
              openContainer();
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ListTile(
                    leading: Icon(Icons.insert_photo),
                    title: Text(post.title!),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
                    child: Image.file(post.image!),
                  ),
                ],
             ),
          ),
        ),
    );
  }
}