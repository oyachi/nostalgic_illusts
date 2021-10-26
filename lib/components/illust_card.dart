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
      openBuilder:(context,_)=>DetailScreen(),
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
                    subtitle: Text(post.description!),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.file(post.image!),
                  ),
                ],
             ),
          ),
        ),
    );
  }
}