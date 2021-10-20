import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
/*models*/
import '../models/post_list.dart';

class PostScreen extends StatelessWidget {
  String _title = "";
  String _description = "";
  String _reflection = "";

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
      body: IntrinsicHeight(
        child: Container(
          padding: EdgeInsets.all(64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  'Title'
              ),
              TextField(
                onChanged: (String value) {
                  _title = value;
                },
              ),
              TextField(
                onChanged: (String value) {
                  _description = value;
                },
              ),
              TextField(
                onChanged: (String value) {
                  _reflection = value;
                }
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => {
                    context.read(postListProvider.notifier).addPost(_title),
                    Navigator.pop(context)
                  },
                  child: Text('Add', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}