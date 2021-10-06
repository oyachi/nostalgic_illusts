import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
/* screens */
import '../screens/detail_screen.dart';

class IllustCard extends StatelessWidget {
  @override
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
                  const ListTile(
                    leading: Icon(Icons.album),
                    title: Text("Macbook"),
                    subtitle: Text("This model is the latest"),
                  ),
                  Image.asset("assets/images/macbook1.jpg")
                ],
             ),
          ),
        ),
    );
  }
}