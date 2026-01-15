import 'package:artneidich_app/features/inspection/data/model/all_job_response.dart';
import 'package:flutter/material.dart';

import '../networks/api_acess.dart';

class InspectionProvider extends ChangeNotifier {
  final ScrollController _scrollController = ScrollController();

  final int _limit = 10;
  int _page = 1;
  bool _isLoading = false;
  bool _hasMore = true;
  String? selectedFilter;
  String? _selectFilter2;

  String? _searchJob;

  final List<Datum> _datum = [];
  final List<String> _dataColumeList = [
    "FHA Case Details",
    "Order ID",
    "Address",
    "Inspector",
    "Date Due",
    "Date Submitted",
    "Status",
    "Action",
  ];

  // Getters
  ScrollController get scrollController => _scrollController;
  List<Datum> get datum => _datum;
  List<String> get dataColumeList => _dataColumeList;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;
  String? get selectFilter2 => _selectFilter2;

  String? get searchJob => _searchJob;

  InspectionProvider() {
    fetchAllJob();
    _scrollListener();
  }

  void _scrollListener() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 50 &&
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

    final response = await allJobRxObj.allJobRx(
      limit: _limit,
      page: _page,
      status: _selectFilter2 == "all" ? null : _selectFilter2,
      search: _selectFilter2 == "all" ? null : _searchJob,
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

  // Filter dropdown

  final List<String> filterList = [
    "All",
    "In Progress",
    "Submitted",
    "Completed",
    "Rejected",
  ];

  void filterToggle(String value) {
    selectedFilter = value;

    // UI API mapping
    if (value == "In Progress") {
      _selectFilter2 = "in_progress";
    } else if (value == "Submitted") {
      _selectFilter2 = "submitted";
    } else if (value == "Completed") {
      _selectFilter2 = "completed";
    } else if (value == "All") {
      _selectFilter2 = "all";
    } else {
      _selectFilter2 = "rejected";
    }

    //  RESET pagination + data
    _datum.clear();
    _page = 1;
    _hasMore = true;

    notifyListeners();

    // fetch with new filter
    fetchAllJob();
  }

  //
  void resetData() {
    _datum.clear();
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
}
