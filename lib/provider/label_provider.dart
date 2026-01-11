import 'package:flutter/material.dart';

class LabelProvider extends ChangeNotifier {
  final List<String> _labelList = [
    "exterior Front elevation",
    "family room",
    "kitchen",
  ];

  List<String> get labelList => _labelList;

  //Create new label
  void addLabel(String label) {
    _labelList.add(label);
    notifyListeners();
  }

  //Edit label by index
  void updateLabel(int index, String newLabel) {
    if (index < 0 || index >= _labelList.length) return;
    _labelList[index] = newLabel;
    notifyListeners();
  }

  /// Delete label
  void deleteLabel(int index) {
    if (index < 0 || index >= _labelList.length) return;
    _labelList.removeAt(index);
    notifyListeners();
  }
}
