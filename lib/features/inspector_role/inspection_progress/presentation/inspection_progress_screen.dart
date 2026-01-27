import 'dart:developer';

import 'package:artneidich_app/common_widget/custom_button.dart';
import 'package:artneidich_app/common_widget/custom_text_field.dart';
import 'package:artneidich_app/gen/assets.gen.dart';
import 'package:artneidich_app/helpers/loading_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../common_widget/header_widget.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../helpers/all_routes.dart';
import '../../../../helpers/navigation_service.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../../networks/api_acess.dart';
import '../../../../provider/inspector_progress_provider.dart';
import '../../../job_details/widgets/job_details_widget.dart';
import '../../inspection_view/data/rx_get/model/inspection_response.dart';
import '../widgets/photos_widget.dart';
import '../widgets/success_alert.dart';

class InspectionProgressScreen extends StatefulWidget {
  final String labelName;
  final String labelID;
  final Datum datum;
  const InspectionProgressScreen({
    super.key,
    required this.labelName,
    required this.datum,
    required this.labelID,
  });

  @override
  State<InspectionProgressScreen> createState() =>
      _InspectionProgressScreenState();
}

class _InspectionProgressScreenState extends State<InspectionProgressScreen> {
  final _noteController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _noteController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log("JOB ID  ==============> ${widget.datum.id ?? ""}");

    log("LABEL ID  ==============> ${widget.labelID}");

    return Consumer<InspectorProgressProvider>(
      builder: (context, provider, child) {
        int totalLabels = provider.inspectorList.length;
        int totalImages = provider.inspectorList.fold(
          0,
          (prev, label) =>
              prev + label.images!.where((img) => img != null).length,
        );
        return Scaffold(
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header AppBar Widget
                HeaderWidget(
                  title: "Jobs",
                  icon: Assets.images.jobsIcon.path,
                  subtitle: 'Inspections',
                ),

                UIHelper.verticalSpace(20.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    "Job Order",
                    style: TextFontStyle.headLine16c141414InterW400.copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: 16.sp,
                    ),
                  ),
                ),

                UIHelper.verticalSpace(20.h),

                JobDetailsWidget(
                  title: 'FHA Case Details',
                  value: widget.datum.fhaCaseDetailsNo ?? "",
                ),
                UIHelper.verticalSpace(20.h),

                JobDetailsWidget(
                  title: 'Assignee Name',
                  value:
                      "${widget.datum.createdBy?.firstName ?? ""} ${widget.datum.createdBy?.lastName ?? ""}",
                ),
                UIHelper.verticalSpace(20.h),
                JobDetailsWidget(
                  title: 'Total Images',
                  value: totalImages.toString(),
                ),
                UIHelper.verticalSpace(20.h),
                JobDetailsWidget(
                  title: 'Total Labels',
                  value: totalLabels.toString(),
                ),
                UIHelper.verticalSpace(20.h),

                // Dynamic Data
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: provider.inspectorList.length,
                  itemBuilder: (_, index) {
                    var data = provider.inspectorList[index];

                    return GestureDetector(
                      onDoubleTap: () {
                        // Remove Label
                        provider.removeLabel(index);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 10.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Label
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Label
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "Label",
                                    style: TextFontStyle
                                        .headLine16c141414InterW400
                                        .copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                        ),
                                  ),
                                ),

                                // colon fixed – no Expanded
                                Text(
                                  ": ",
                                  style: TextFontStyle
                                      .headLine16c141414InterW400
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
                                      ),
                                ),

                                UIHelper.horizontalSpace(20.w),

                                // value
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEFEFF1),
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.w,
                                      vertical: 6.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          data.labelName ?? "",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,

                                          style: TextFontStyle
                                              .headLine16c141414InterW400
                                              .copyWith(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                                fontSize: 14.sp,
                                              ),
                                        ),

                                        //  Delete Label
                                        InkWell(
                                          onTap: () {
                                            provider.removeLabel(index);
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            UIHelper.verticalSpace(10.h),

                            //
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "Captured Image",
                                    style: TextFontStyle
                                        .headLine16c141414InterW400
                                        .copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                        ),
                                  ),
                                ),

                                // colon fixed – no Expanded
                                Text(
                                  ": ",
                                  style: TextFontStyle
                                      .headLine16c141414InterW400
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
                                      ),
                                ),

                                //  value comes just after colon
                                Expanded(
                                  flex: 2,
                                  child: LabelPhotosWidget(
                                    // for image index find and remove index
                                    provider: provider,
                                    labelIndex: index,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                UIHelper.verticalSpace(20.h),

                // Create Label button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: CustomButton(
                      minWidth: 0,
                      borderSide: BorderSide(color: Colors.grey.shade300),
                      onPressed: () {
                        NavigationService.navigateToWithArgs(
                          Routes.inspectionLabelScreen,
                          {"labelType": "createLabel", "datum": widget.datum},
                        );
                      },
                      borderRadius: 12.r,
                      padding: EdgeInsets.symmetric(
                        vertical: 12.h,
                        horizontal: 12.w,
                      ),

                      color: Colors.white,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 8.w,
                        children: [
                          Icon(
                            Icons.add,
                            size: 16.sp,
                            color: Color(0xFF2D8D7C),
                          ),

                          Text(
                            "Create Label",
                            style: TextFontStyle.headLine16c141414InterW400
                                .copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF2D8D7C),
                                  fontSize: 14.sp,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                UIHelper.verticalSpace(20.h),

                UIHelper.verticalSpace(20.h),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
                  child: Text(
                    "Note to Admin",
                    style: TextFontStyle.headLine16c141414InterW400.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                ),

                UIHelper.verticalSpace(8.h),

                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
                  child: CustomTextField(
                    maxLines: 5,
                    hintStyle: TextFontStyle.headLine16c141414InterW400
                        .copyWith(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF71717A),
                          fontSize: 14.sp,
                        ),
                    hintText: "Found damage on rooftop",
                    maxLength: 250,
                    controller: _noteController,
                  ),
                ),

                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
                  child: Text(
                    "Keep notes under 250 characters",
                    style: TextFontStyle.headLine16c141414InterW400.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF71717A),
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                UIHelper.verticalSpace(30.h),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
                  child: CustomButton(
                    onPressed: () async {

                      // 
                      createReportRxObj
                          .createJobRx(
                            id: widget.datum.id!,
                            provider: provider,
                               noteToAdmin: _noteController.text.toString(),
                          )
                          .waitingForFuture()
                          .then((success) {
                            if (success) {
                              showDialog(
                                context: context,
                                builder: (dilogCOntetx) => SuccessAlert(
                                  provider: provider,
                                  controller: _noteController,
                                ),
                              );
                            }
                          });
                      // if (provider.inspectorList.isEmpty) {
                      //   ToastUtil.showShortToast("No labels exist.");
                      // } else if (!provider.hasAnyImage()) {
                      //   ToastUtil.showShortToast(
                      //     "No images uploaded in any label.",
                      //   );
                      // } else {
                      //   // Check if every label has at least one image
                      //   bool allLabelsHaveImage = provider.inspectorList.every(
                      //     (label) =>
                      //         label.images != null &&
                      //         label.images!.any((img) => img != null),
                      //   );

                      //   if (!allLabelsHaveImage) {
                      //     ToastUtil.showShortToast(
                      //       "Each label must have at least one image.",
                      //     );
                      //   } else {
                      //     // All validations passed - proceed with API call
                      //     // ToastUtil.showShortToast("YEAH!!!");
                      //     createReportRxObj
                      //         .createJobRx(
                      //           id: widget.datum.id!,
                      //           provider: provider,
                      //       //    noteToAdmin: _noteController.text.toString(),
                      //         )
                      //         .waitingForFuture()
                      //         .then((success) {
                      //           if (success) {
                      //             showDialog(
                      //               context: context,
                      //               builder: (dilogCOntetx) => SuccessAlert(
                      //                 provider: provider,
                      //                 controller: _noteController,
                      //               ),
                      //             );
                      //           }
                      //         });
                      //   }
                      // }
                    },

                    text: "Submit",
                  ),
                ),

                UIHelper.verticalSpaceSemiLarge,
              ],
            ),
          ),
        );
      },
    );
  }
}
