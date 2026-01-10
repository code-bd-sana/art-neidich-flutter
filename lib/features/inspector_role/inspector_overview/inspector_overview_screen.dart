import 'package:artneidich_app/constants/text_font_style.dart';
import 'package:artneidich_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../overview/widgets/job_section_widget.dart';
import '../widgets/inspector_overview_widget.dart';

class InspectorOverviewScreen extends StatefulWidget {
  const InspectorOverviewScreen({super.key});

  @override
  State<InspectorOverviewScreen> createState() =>
      _InspectorOverviewScreenState();
}

class _InspectorOverviewScreenState extends State<InspectorOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    String name = "Arti";
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
                email: 'admin@admin.com',
                fName: name,
                name: 'ArtNeidich',
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
            ],
          ),
        ),
      ),
    );
  }
}
