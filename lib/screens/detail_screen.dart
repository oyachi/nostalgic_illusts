import 'package:flutter/material.dart';
/* components */
import '../components/illust_preview.dart';
import '../components/illust_description.dart';
import '../components/detail_bottom_buttons.dart';
/* models */
import '../models/post.dart';

class DetailScreen extends StatelessWidget {
  Post post;
  DetailScreen(this.post);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
        appBar: AppBar(
          backgroundColor: Color(0xFFF5F6F9),
          leading: SizedBox(
            width: double.infinity,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: ()=>Navigator.pop(context),
              color: Colors.black45,
            ),
          ),
        ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    IllustPreviwe(post.image!),
                    IllustDescription(post.title!, post.description!, post.reflection!),
                    Expanded(child: Container(color: Colors.white,)),
                    DetailBottomButtons(post),
                  ],
                ),
              ),
            ),
          );
        }
      )
    );
  }
}