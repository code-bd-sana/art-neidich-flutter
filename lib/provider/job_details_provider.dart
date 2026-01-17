import 'package:flutter/material.dart';

import '../features/job_details/data/rx_get_summary/model/summary_response.dart';
import '../networks/api_acess.dart';

class JobDetailsProvider extends ChangeNotifier {

  Data? _data;
  bool _isLoading = false;
  String? _error;

  Data? get data => _data;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchJobSummarry({required String id}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await summaryRxObj.summaryRx(id: id);
      _data = response.data;

      if (_data == null) {
        _error = "No data found";
      }
    } catch (e) {
      _error = "Something went wrong";
    }

    _isLoading = false;
    notifyListeners();
  }
}


