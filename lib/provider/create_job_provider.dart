import 'package:flutter/material.dart';

import '../features/create_job/data/rx_get_all_user/model/all_user_response.dart';
import '../networks/api_acess.dart';

class CreateJobProvider extends ChangeNotifier {
  final List<Datum> _users = [];
  List<Datum> get users => _users;

  final ScrollController scrollController = ScrollController();

  int _page = 1;
  final int _limit = 10;
  int _totalPages = 1;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  CreateJobProvider() {
    // initial fetch
    fetchUsers();

    // listen scroll for pagination
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          !_isLoading &&
          _page < _totalPages) {
        _page++;
        fetchUsers();
      }
    });
  }

  Future<void> fetchUsers() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await allUserRxObj.allUserRx(
        isApproved: true,
        role: 2,
        page: _page,
        isSuspended: false,
        limit: _limit,
      );

      // Append new users
      _users.addAll(response.data ?? []);

      // Update total pages
      _totalPages = response.metaData?.totalPage ?? 0;
    } catch (e) {
      debugPrint("Error fetching users: $e");
    }

    _isLoading = false;
    notifyListeners();
  }

  void reset() {
    _users.clear();
    _page = 1;
    _totalPages = 1;
    notifyListeners();
    fetchUsers();
  }
}
