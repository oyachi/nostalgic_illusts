import 'package:flutter/material.dart';
import 'dart:io';

class IllustPreviwe extends StatelessWidget {
  File image;
  IllustPreviwe(this.image);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 0.0, left: 8.0, right: 8.0),
      child: Image.file(image),
    );
  }
}