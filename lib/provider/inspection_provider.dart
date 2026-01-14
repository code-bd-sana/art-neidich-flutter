import 'package:flutter/material.dart';

class InspectionProvider extends ChangeNotifier {}

// import 'package:artneidich_app/features/inspection/data/model/all_job_response.dart';
// import 'package:flutter/material.dart';

// import '../networks/api_acess.dart';

// class InspectionProvider extends ChangeNotifier {
//   final ScrollController _scrollController = ScrollController();
//   final int _limit = 10;
//   int _page = 1; // make it mutable
//   bool _isLoading = false; // start as false
//   final List<Datum> _datum = [];

//   // Getters
//   int get limit => _limit;
//   int get page => _page;
//   bool get isLoading => _isLoading;
//   List<Datum> get datum => _datum;
//   ScrollController get scrollController => _scrollController;

//   InspectionProvider() {
//     _scrollController.addListener(_scrollListener);
//   }

//   void _scrollListener() {
//     if (_scrollController.position.pixels >=
//             _scrollController.position.maxScrollExtent - 100 &&
//         !_isLoading) {
//       fetchAllJob(); // fetch next page
//     }
//   }

//   Future<void> fetchAllJob() async {
//     _isLoading = true;
//     notifyListeners();

//     final response = await allJobRxObj.allUserRx(limit: _limit, page: _page);

//     if (response.data != null && response.data!.isNotEmpty) {
//       _datum.addAll(response.data!); // append new data
//       _page++; // increment page
//     }

//     _isLoading = false;
//     notifyListeners();
//   }

//   void resetData() {
//     _datum.clear();
//     _page = 1;
//     notifyListeners();
//     fetchAllJob();
//   }
// }
