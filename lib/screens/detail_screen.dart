import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F6F9),
        leading: SizedBox(
          width: double.infinity,
          child: FlatButton(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            color: Colors.white,
            onPressed: ()=>Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      body: Column(
        children: [
          Image.asset("assets/images/macbook1.jpg"),
        ],
      )
    );
  }
}