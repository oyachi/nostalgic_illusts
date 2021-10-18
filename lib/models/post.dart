import 'package:uuid/uuid.dart';

var _uuid = Uuid();

class Post {
  Post({
    this.title,
    this.description,
    this.reflection,
    String? id,
    }) : id = id ?? _uuid.v4();

  final String? id;
  final String? title;
  final String? description;
  final String? reflection;
}