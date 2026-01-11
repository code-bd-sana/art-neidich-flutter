import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';

class InspectorProgressProvider extends ChangeNotifier{


  List<Map<String, dynamic>> inspectorLabelList = [
    {"label": "Label 1", "images": Assets.images.inspection.path},
  ];

  // Method to dynamically add new label with multiple images
  void addLabel(String label, List<String> imagePaths) {
    inspectorLabelList.add({"label": label, "images": imagePaths});
    notifyListeners(); // notify UI to update
  }

}