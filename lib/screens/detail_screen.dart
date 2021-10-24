import 'package:flutter/material.dart';
/* components */
import '../components/illust_preview.dart';
import '../components/illust_description.dart';

class DetailScreen extends StatelessWidget {
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
      body: Column(
        children: [
          IllustPreviwe(),
          IllustDescription(),
        ],
      )
    );
  }
}