import 'package:uuid/uuid.dart';
import 'dart:io';

var _uuid = Uuid();

class Post {
  Post({
    this.title,
    this.description,
    this.reflection,
    this.image,
    String? id,
    }) : id = id ?? _uuid.v4();

  final String? id;
  String? title;
  String? description;
  String? reflection;
  final File? image;
}