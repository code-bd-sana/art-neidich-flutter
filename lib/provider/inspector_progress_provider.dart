import 'package:artneidich_app/helpers/toast.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../features/inspector_role/inspection_progress/model/inspector_label_model.dart';

class InspectorProgressProvider extends ChangeNotifier {
  //  List
  List<InspectorLabelModel> inspectorList = [];

  void createLabel({required String labelName}) {
    inspectorList.add(
      InspectorLabelModel(
        labelName: labelName,
        images: List<String>.filled(2, ""),
      ),
    );
    notifyListeners();
  }

  Future<void> pickedImage(int labelIndex, int imageIndex) async {
    final imagePicker = ImagePicker();

    final XFile? file = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (file != null) {
      inspectorList[labelIndex].images![imageIndex] = file.path;
    } else {
      ToastUtil.showShortToast("You haven't selected any image.");
    }
    notifyListeners();
  }

  // remove image
  void removeImage(int labelIndex, int imageIndex) {
    inspectorList[labelIndex].images![imageIndex] = "";
    notifyListeners();
  }

  // Remove Label
  void removeLabel(int index) {
    inspectorList.removeAt(index);
    notifyListeners();
  }

  
}
