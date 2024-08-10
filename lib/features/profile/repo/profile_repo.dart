import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfileServices {
  static Future<File?> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}