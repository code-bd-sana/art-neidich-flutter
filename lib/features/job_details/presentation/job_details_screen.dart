import 'dart:developer';

import 'package:artneidich_app/features/job_details/tab/photos_widget.dart';
import 'package:artneidich_app/features/job_details/tab/report_widget.dart';
import 'package:artneidich_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widget/header_widget.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../tab/email_log.dart';
import '../tab/summary_widget.dart';

class JobDetailsScreen extends StatefulWidget {
  final String id;
  const JobDetailsScreen({super.key, required this.id});

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  final List<Map<String, dynamic>> _tabList = [
    {"icon": Assets.images.summary.path, "title": "Summary"},
    {"icon": Assets.images.photos.path, "title": "Photos"},
    {"icon": Assets.images.report.path, "title": "Report"},
    {"icon": Assets.images.email.path, "title": "Email Log"},
  ];

  int selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    log("ID=========================== ${widget.id}");
    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWidget(
              title: 'Jobs',
              icon: Assets.images.jobsIcon.path,
              subtitle: 'Job Details',
            ),

            // Tabbar Widget

            // Custom Tabbar
            SizedBox(
              height: 48.h,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(_tabList.length, (index) {
                    final bool isSelected = selectedTabIndex == index;
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedTabIndex = index;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 0.w,
                          vertical: 10.h,
                        ),
                        alignment: Alignment.center,
                        decoration: isSelected
                            ? BoxDecoration(
                                color: isSelected
                                    ? Colors.grey.shade200
                                    : Colors.transparent,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8.r),
                                  topRight: Radius.circular(8.r),
                                ),
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xFF2D8D7C),
                                    width: 1.5.w,
                                  ),
                                ),
                              )
                            : BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xFFDFE3E8),
                                    width: 1.w,
                                  ),
                                ),
                              ),

                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Row(
                            spacing: 4.w,
                            children: [
                              Image.asset(
                                _tabList[index]["icon"],
                                width: 16.w,
                                height: 16.h,
                                fit: BoxFit.cover,
                              ),

                              Text(
                                _tabList[index]["title"],
                                style: TextFontStyle.headLine16c141414InterW400
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            UIHelper.verticalSpace(10.h),

            selectedTabIndex == 0
                ? SummaryWidget()
                : selectedTabIndex == 1
                ? PhotosWidget()
                : selectedTabIndex == 2
                ? ReportWidget()
                : EmailLog(),

            UIHelper.verticalSpaceExtraLarge,
          ],
        ),
      ),
      //  floatingActionButton: CreateJob(),
    );
  }
}
