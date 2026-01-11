import 'package:artneidich_app/common_widget/custom_button.dart';
import 'package:artneidich_app/common_widget/custom_text_field.dart';
import 'package:artneidich_app/gen/assets.gen.dart';
import 'package:artneidich_app/helpers/all_routes.dart';
import 'package:artneidich_app/helpers/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../common_widget/header_widget.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../../provider/inspector_progress_provider.dart';
import '../../../job_details/widgets/job_details_widget.dart';
import '../widgets/photos_widget.dart';

class InspectionProgressScreen extends StatefulWidget {
  final String labelName;
  const InspectionProgressScreen({super.key, required this.labelName});

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
              value: '1234-4589-8984',
            ),
            UIHelper.verticalSpace(20.h),

            JobDetailsWidget(title: 'Inspector Name', value: 'John Doe'),
            UIHelper.verticalSpace(20.h),
            JobDetailsWidget(title: 'Total Image', value: '23'),
            UIHelper.verticalSpace(20.h),
            JobDetailsWidget(title: 'Total Labels', value: '10'),
            UIHelper.verticalSpace(20.h),

            // Dynamic Data
            Consumer<InspectorProgressProvider>(
              builder: (context, inspectorProgressProvider, child) {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount:
                      inspectorProgressProvider.inspectorLabelList.length,

                  itemBuilder: (_, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 10.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                style: TextFontStyle.headLine16c141414InterW400
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
                                  child: Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    inspectorProgressProvider
                                        .inspectorLabelList[index]["label"],
                                    style: TextFontStyle
                                        .headLine16c141414InterW400
                                        .copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                          fontSize: 14.sp,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          UIHelper.verticalSpace(10.h),

                          // Image.
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
                                style: TextFontStyle.headLine16c141414InterW400
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                              ),

                              // value comes just after colon
                              Expanded(flex: 2, child: LabelPhotosWidget()),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
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
                    NavigationService.navigateTo(
                      Routes.repeatInspectionLabelScreen,
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
                      Icon(Icons.add, size: 16.sp, color: Color(0xFF2D8D7C)),

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
                hintStyle: TextFontStyle.headLine16c141414InterW400.copyWith(
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
                  await showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 8.h,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Inspection successfully completed",
                              style: TextFontStyle.headLine14c323539InterW400
                                  .copyWith(
                                    color: const Color(0xFF09090B),
                                    fontSize: 16.sp,

                                    fontWeight: FontWeight.w600,
                                  ),
                            ),

                            Text(
                              "Congrats! the assigned 10,001 job successfully completed. ",
                              style: TextFontStyle.headLine14c323539InterW400
                                  .copyWith(
                                    color: const Color(0xFF71717A),
                                    fontSize: 14.sp,

                                    fontWeight: FontWeight.w400,
                                  ),
                            ),

                            Row(
                              spacing: 16.w,
                              children: [
                                Expanded(
                                  child: CustomButton(
                                    color: Color(0xFFF4F4F5),
                                    onPressed: () {
                                      NavigationService.goBack;
                                    },
                                    style: TextFontStyle
                                        .headLine16c2D8D7CInterW700
                                        .copyWith(
                                          color: const Color(0xFF09090B),
                                          fontSize: 14.sp,

                                          fontWeight: FontWeight.w500,
                                        ),
                                    text: "Close",
                                  ),
                                ),

                                Expanded(
                                  flex: 2,
                                  child: CustomButton(
                                    onPressed: () {
                                      NavigationService.goBack;
                                    },

                                    text: "Start Inspection",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                text: "Submit",
              ),
            ),

            UIHelper.verticalSpaceSemiLarge,
          ],
        ),
      ),
    );
  }
}
