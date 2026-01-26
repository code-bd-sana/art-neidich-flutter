import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../../../../networks/dio/dio.dart';
import '../../../../../../../networks/endpoints.dart';
import '../../../../../../../networks/exception_handler/data_source.dart';
import '../../model/inspector_label_model.dart';

final class CreateReportApi {
  static final CreateReportApi _singleton = CreateReportApi._internal();
  CreateReportApi._internal();
  static CreateReportApi get instance => _singleton;

  Future<Map> createReportApi({
    required List<InspectorLabelModel> images,
    required String job,
  }) async {
    try {
      List<Map<String, dynamic>> imagesPayload = images
          .where((e) => e.images != null && e.images!.isNotEmpty)
          .map((e) {
            return {
              "imageLabel": e.labelID,
              "images": e.images!
                  .map(
                    (img) => {
                      MultipartFile.fromFileSync(
                        img!.path,
                        filename: img.path.split('/').last,
                      ),
                    },
                  )
                  .toList(),
            };
          })
          .toList();

      log("Image PayLoad ===================== $imagesPayload");



      FormData fromData = FormData.fromMap({
        "job": job,
        "images": imagesPayload,
      });

      log("fromData ========================= $fromData");

      final Response response = await postHttp(
        Endpoints.createReport(),
        fromData,
      );


      log("data ===========> $response");
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(json.encode(response.data));

        return data;
      } else {
          log("else data ===========> $response");
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
        log("error data ===========> $error");
      rethrow;
    }
  }
}
