import 'package:artneidich_app/constants/text_font_style.dart';
import 'package:artneidich_app/features/overview/widgets/activity_widget.dart';
import 'package:artneidich_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widget/create_job.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/navigation_service.dart';
import '../../../networks/api_acess.dart';
import '../widgets/job_section_widget.dart';
import '../widgets/overview_app_bar_widget.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  String firstName = "";
  String lastName = "";
  String email = "";

  @override
  void initState() {
    super.initState();
    profileRxObj.profileRx().then((response) {
      setState(() {
        firstName = response.data?.firstName ?? "";
        lastName = response.data?.lastName ?? "";
        email = response.data?.email ?? "";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OverviewAppBarWidget(
                email: email,
                fName: firstName,
                name: "$firstName $lastName",
              ),

              UIHelper.verticalSpace(30.h),
              Text(
                "Summary",
                style: TextFontStyle.headLine16c141414InterW400.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                ),
              ),
              UIHelper.verticalSpace(8.h),

              // Summary Widget
              JobSection(
                title: 'Total Jobs',
                subtitle: '47 Jobs this week',
                icon: Icons.star_border,
                iconColor: Colors.black,
              ),
              JobSection(
                title: 'Pending',
                subtitle: '7 Jobs this week',
                icon: Icons.schedule,
                iconColor: Colors.orange,
              ),
              JobSection(
                title: 'Overdue',
                icon: Icons.block,
                subtitle: '5 Jobs this week',
                iconColor: Colors.red,
              ),
              JobSection(
                title: 'Completed Today',
                icon: Icons.check,
                subtitle: '10 Jobs this week',
                iconColor: Colors.green,
              ),

              UIHelper.verticalSpace(30.h),
              Text(
                "Activity",
                style: TextFontStyle.headLine16c141414InterW400.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                ),
              ),

              UIHelper.verticalSpace(10.h),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) =>
                    Divider(color: Colors.black.withValues(alpha: 0.3)),
                itemCount: 15,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: ActivityWidget(
                      fName: 'as',
                      jobId: 'Job #10052 for 129 Oak ',
                      status: 'Lane was submitted by Michael Chen.',
                      time: "just now",
                    ),
                  );
                },
              ),

              UIHelper.verticalSpace(20.h),
            ],
          ),
        ),
      ),
      floatingActionButton: CreateJob(
        heroTag: "overview_screen_tag",
        title: 'Create New Job',
        onpressed: () {
          NavigationService.navigateTo(Routes.createJobScreen);
        },
      ),
    );
  }
}
