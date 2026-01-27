import 'package:flutter/material.dart';

import '../features/inspector_role/inspection_view/data/rx_get/model/inspection_response.dart';
import '../networks/api_acess.dart';

class AssignInspectorProvider extends ChangeNotifier {
  final ScrollController _scrollController = ScrollController();

  final int _limit = 10;
  int _page = 1;
  bool _isLoading = false;
  bool _hasMore = true;
  String? _searchJob;

  final List<Datum> _datum = [];
  final List<String> _dataColumeList = [
    "FHA Case Details",
    "Order ID",
    "Date Due",
    "Status",
    "Action",
     "",
  ];

  // Getters
  ScrollController get scrollController => _scrollController;
  List<Datum> get datum => _datum;
  List<String> get dataColumeList => _dataColumeList;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;

  String? get searchJob => _searchJob;

  AssignInspectorProvider() {
    fetchAllJob();
    _scrollListener();
  }

  void _scrollListener() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !_isLoading &&
          _hasMore) {
        fetchAllJob();
      }
    });
  }

  Future<void> fetchAllJob() async {
    if (_isLoading) return;

    _isLoading = true;
    notifyListeners();

    final response = await inspectionRxObj.inspectionRx(
      limit: _limit,
      page: _page,
      search: _searchJob,
    );

    if (response.data != null && response.data!.isNotEmpty) {
      _datum.addAll(response.data!);
      _page++;
    } else {
      _hasMore = false;
    }

    _isLoading = false;
    notifyListeners();
  }

  //
  void resetData() {
    _datum.clear();
    _searchJob = null;
    _page = 1;
    notifyListeners();
    fetchAllJob();
  }

  void searchJobUpdate(String value) async {
    _searchJob = value;
    //  RESET pagination + data
    _datum.clear();
    _page = 1;
    _hasMore = true;
    notifyListeners();
    // fetch with new filter
    fetchAllJob();
  }

  Future<void> refreshData() async {
    _datum.clear();
    _page = 1;
    _hasMore = true;
    _isLoading = false;
    notifyListeners(); // let UI rebuild immediately
    await fetchAllJob(); // fetch fresh data
  }

}
