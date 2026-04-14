import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  Future<File?> pickFromCamera()async{
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera,
    imageQuality: 80
    );
    return photo !=null ? File(photo.path) : null;
  }

  Future<File?> pickFromGallery()async{
    final XFile? photo = await _picker.pickImage(source: ImageSource.gallery,
    imageQuality: 80
    );
    return photo != null ? File(photo.path) : null;
  }
}