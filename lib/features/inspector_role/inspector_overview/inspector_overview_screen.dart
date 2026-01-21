import 'package:artneidich_app/constants/text_font_style.dart';
import 'package:artneidich_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../networks/api_acess.dart';
import '../../../provider/inspector_overview_provider.dart';
import '../../overview/widgets/job_section_widget.dart';
import '../widgets/inspector_overview_widget.dart';

class InspectorOverviewScreen extends StatefulWidget {
  const InspectorOverviewScreen({super.key});

  @override
  State<InspectorOverviewScreen> createState() =>
      _InspectorOverviewScreenState();
}

class _InspectorOverviewScreenState extends State<InspectorOverviewScreen> {
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
    return Consumer<InspectorOverviewProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Colors.white,

          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            physics: BouncingScrollPhysics(),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InspectorOverviewAppBarWidget(
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
                    subtitle: provider.data?.data?.totalJobs.toString() ?? '0',
                    icon: Icons.star_border,
                    iconColor: Colors.black,
                  ),
                  JobSection(
                    title: 'Pending',
                    subtitle:
                        provider.data?.data?.inProgressJobs.toString() ?? '0',
                    icon: Icons.schedule,
                    iconColor: Colors.orange,
                  ),
                  JobSection(
                    title: 'Overdue',
                    icon: Icons.block,
                    subtitle:
                        provider.data?.data?.overDueJobs.toString() ?? '0',
                    iconColor: Colors.red,
                  ),
                  JobSection(
                    title: 'Completed Today',
                    icon: Icons.check,
                    subtitle:
                        provider.data?.data?.completedJobs.toString() ?? '0',
                    iconColor: Colors.green,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
