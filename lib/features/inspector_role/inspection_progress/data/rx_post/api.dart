import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../../../../networks/dio/dio.dart';
import '../../../../../../../networks/endpoints.dart';
import '../../../../../../../networks/exception_handler/data_source.dart';

final class CreateReportApi {
  static final CreateReportApi _singleton = CreateReportApi._internal();
  CreateReportApi._internal();
  static CreateReportApi get instance => _singleton;

  Future<Map> createReportApi({
    required String job,
    required List<Map<String, dynamic>> images,
  }) async {
    try {
      FormData formData = FormData.fromMap({"job": job});

      Response response = await postHttp(Endpoints.createReport(), formData);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(json.encode(response.data));
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}

// import 'dart:convert';

// import 'package:dio/dio.dart';

// import '../../../../../../../networks/dio/dio.dart';
// import '../../../../../../../networks/endpoints.dart';
// import '../../../../../../../networks/exception_handler/data_source.dart';

// final class CreateReportApi {
//   static final CreateReportApi _singleton = CreateReportApi._internal();
//   CreateReportApi._internal();

//   static CreateReportApi get instance => _singleton;

//   Future<Map> createReportApi({
//     required String job,
//     required List<Map<String, dynamic>> images,
//   }) async {
//     try {
//       FormData formData = FormData.fromMap({"job": job, "images": images});

//       Response response = await postHttp(Endpoints.createReport(), formData);
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final data = jsonDecode(json.encode(response.data));
//         return data;
//       } else {
//         // Handle non-200 status code errors
//         throw DataSource.DEFAULT.getFailure();
//       }
//     } catch (error) {
//       // Handle generic errors
//       rethrow;
//     }
//   }
// }
