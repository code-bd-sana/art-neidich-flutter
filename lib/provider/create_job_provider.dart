import 'package:flutter/material.dart';

import '../features/create_job/data/rx_get_all_user/model/all_user_response.dart';
import '../networks/api_acess.dart';

class CreateJobProvider extends ChangeNotifier {
  //int _currentPage = 1;
  // int _totalPage = 1;

  Datum? _selectInspectorName;
  List<Datum> _inspectorList = [];

  // int get currentPage => _currentPage;
  // int get totalPage => _totalPage;
  List<Datum> get inspectorList => _inspectorList;

  Datum? get selectInspectorName => _selectInspectorName;

  Future<void> fetchUsers() async {
    final response = await allUserRxObj.allUserRx(
      page: 2,
      role: 2,
      isApproved: true,
      isSuspended: false,
    );

    //_currentPage = response.metaData?.page ?? 1;
    //_totalPage = response.metaData?.totalPage ?? 1;
    _inspectorList = response.data ?? [];

    notifyListeners();
  }

  /// Update selected user
  void setSelectedUser(Datum user) {
    _selectInspectorName = user;
    notifyListeners();
  }

  /// Get selected user id for backend
  String? get selectedUserId => _selectInspectorName?.id;
}
