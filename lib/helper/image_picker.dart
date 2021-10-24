import 'dart:io';
import 'package:image_picker/image_picker.dart';

final picker = ImagePicker();

Future getImageFromGallery() async {
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  return File(pickedFile!.path);
}