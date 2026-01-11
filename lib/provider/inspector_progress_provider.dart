import 'package:artneidich_app/helpers/toast.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InspectorProgressProvider extends ChangeNotifier {
  List<Map<String, dynamic>> inspectorLabelList = [];

  // add label
  void addLabel(String label) {
    inspectorLabelList.add({
      "label": label,
      "images": List<String>.filled(2, ""), // two empty slots
    });
    notifyListeners();
  }

  Future<void> pickedImage(int labelIndex, int imageIndex) async {
    final imagePicker = ImagePicker();

    final XFile? file = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (file != null) {
      inspectorLabelList[labelIndex]["images"][imageIndex] = file.path;
      notifyListeners();
    } else {
      ToastUtil.showShortToast("You haven't selected any image.");
    }
  }

  // remove image
  void removeImage(int labelIndex, int imageIndex) {
    inspectorLabelList[labelIndex]["images"][imageIndex] = "";
    notifyListeners();
  }
}
