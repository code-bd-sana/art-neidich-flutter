import 'package:flutter/material.dart';

class RoleProvider extends ChangeNotifier {
  int selectedRoleIndex = -1;
  String? _role;

  String? get role => _role;

  void setRole(int index, String value) {
    selectedRoleIndex = index;
    _role = value;
    notifyListeners();
  }
}
