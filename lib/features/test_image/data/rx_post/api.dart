import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../../../../networks/dio/dio.dart';
import '../../../../../../../networks/endpoints.dart';
import '../../../../../../../networks/exception_handler/data_source.dart';

final class SingleImageApi {
  static final SingleImageApi _singleton = SingleImageApi._internal();
  SingleImageApi._internal();
  static SingleImageApi get instance => _singleton;

  Future<Map> singleImageApi({required File image}) async {
    try {
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(image.path),
      });


       log("SingleImageApi formData =====================> $formData");

      final Response response = await postHttp(
        Endpoints.singleImageP(),
        formData,
      );

      log("SingleImageApi Response =====================> $response");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(json.encode(response.data));


         log("SingleImageApi Data =====================> $data");


        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
