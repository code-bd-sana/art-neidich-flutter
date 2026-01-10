import 'package:flutter/material.dart';

class PushNotificationProvider extends ChangeNotifier {
  final pushController = ValueNotifier<bool>(false);

  bool isPush = false;

  void toggleUpdatePush(bool value) {
    pushController.value = value;
    isPush = value;
    notifyListeners();
  }



// Due Date 
  final dueDateController = ValueNotifier<bool>(false);
  bool isDueDate = false;
  void toggleUpdateDueDate(bool value) {
    dueDateController.value = value;
    isDueDate = value;
    notifyListeners();
  }
}
