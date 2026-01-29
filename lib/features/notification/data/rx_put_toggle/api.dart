import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../../networks/dio/dio.dart';
import '../../../../../networks/endpoints.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class NotificationOnOffApi {
  static final NotificationOnOffApi _singleton =
      NotificationOnOffApi._internal();
  NotificationOnOffApi._internal();

  static NotificationOnOffApi get instance => _singleton;

  Future<Map> notificationOnOffApi({required String deviceId}) async {
    try {
      Map data = {"deviceId": deviceId};

      Response response = await putHttp(Endpoints.toggleNotification(), data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(json.encode(response.data));
        return data;
      } else {
        // Handle non-200 status code errors
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle generic errors
      rethrow;
    }
  }
}
