import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:io';
/*models*/
import '../models/post.dart';
import '../models/post_list.dart';

class EditScreen extends StatelessWidget {
  Post post;
  EditScreen(this.post);
  String _title = "";
  String _description = "";
  String _reflection = "";

  @override
  Widget build(BuildContext context) {
    //FocusNodes
    final _descriptionFocusNode = FocusNode();
    final _reflectionFocusNode = FocusNode();
    //Form Save
    final _form = GlobalKey<FormState>();

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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              child: Image.file(post.image!),
            ),
            Form(
              key: _form,
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          TextFormField(
                              maxLength: 20,
                              textInputAction: TextInputAction.next,
                              controller: TextEditingController(text: post.title),
                              onFieldSubmitted: (_) {
                                FocusScope.of(context).requestFocus(_descriptionFocusNode);
                              },
                              onSaved: (value) {
                                _title = value!;
                              },
                              decoration: InputDecoration(
                                labelText: 'Title',
                                labelStyle: TextStyle(color: Colors.grey),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please provide a title';
                                }
                                if(value.length > 20) {
                                  return 'title must be less than 20 characters.';
                                }
                                return null;
                              }
                          ),
                          TextFormField(
                              maxLength: 180,
                              maxLines: 3,
                              textInputAction: TextInputAction.next,
                              controller: TextEditingController(text: post.description),
                              onFieldSubmitted: (_) {
                                FocusScope.of(context).requestFocus(_reflectionFocusNode);
                              },
                              focusNode: _descriptionFocusNode,
                              onSaved: (value) {
                                _description = value!;
                              },
                              decoration: InputDecoration(
                                labelText: 'Description',
                                labelStyle: TextStyle(color: Colors.grey),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please provide a description';
                                }
                                if(value.length > 180) {
                                  return 'title must be less than 180 characters.';
                                }
                                return null;
                              }
                          ),
                          TextFormField(
                              maxLength: 180,
                              maxLines: 3,
                              textInputAction: TextInputAction.next,
                              controller: TextEditingController(text: post.reflection),
                              focusNode: _reflectionFocusNode,
                              onSaved: (value) {
                                _reflection = value!;
                              },
                              decoration: InputDecoration(
                                labelText: 'Reflection',
                                labelStyle: TextStyle(color: Colors.grey),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please provide a reflection';
                                }
                                if(value.length > 180) {
                                  return 'title must be less than 180 characters.';
                                }
                                return null;
                              }
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: ElevatedButton.icon(
                      onPressed: () => {
                        if(_form.currentState!.validate()) {
                          _form.currentState!.save(),
                          context.read(postListProvider.notifier).editPost(_title, _description, _reflection, post),
                          Navigator.pop(context),
                          Navigator.pop(context),
                        },

                      },
                      label: Text('Edit', style: TextStyle(color: Colors.white)),
                      icon: Icon(Icons.edit),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}