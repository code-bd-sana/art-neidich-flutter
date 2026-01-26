import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TestImageProvider with ChangeNotifier {
  File? _file;

  File? get file => _file;

  final _imagePicker = ImagePicker();

  Future<void> pickedIMage({required ImageSource imageSource}) async {
    XFile? pickedFile = await _imagePicker.pickImage(source: imageSource);

    if (pickedFile != null) {
      _file = File(pickedFile.path);
    } else {
      debugPrint("Failed to uploaded Images");
    }
    notifyListeners();
  }
}
