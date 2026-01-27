import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../../../../networks/dio/dio.dart';
import '../../../../../../../networks/endpoints.dart';
import '../../../../networks/exception_handler/data_source.dart';

final class MultipleImageApi {
  static final MultipleImageApi _singleton = MultipleImageApi._internal();
  MultipleImageApi._internal();
  static MultipleImageApi get instance => _singleton;

  Future<Map> multipleImageApi({required List<File> images}) async {
    try {
      List<MultipartFile> fileImages = images.map((image) {
        return MultipartFile.fromFileSync(image.path);
      }).toList();
      FormData formData = FormData.fromMap({"images": fileImages});

      log("MultipleImageApi formData =====================> $formData");

      final Response response = await postHttp(
        Endpoints.multipleImageP(),
        formData,
      );

      log("MultipleImageApi Response =====================> $response");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(json.encode(response.data));

        log("MultipleImageApi Data =====================> $data");

        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      log("Errooroooooo====================== $error");
      rethrow;
    }
  }
}
