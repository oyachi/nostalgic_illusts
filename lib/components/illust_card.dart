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
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ListTile(
                      leading: Icon(Icons.insert_photo),
                      title: Text(post.title!),
                      subtitle: Text(post.description!),
                    ),
                    Image.file(post.image!)
                  ],
               ),
          ),
            ),
        ),
    );
  }
}