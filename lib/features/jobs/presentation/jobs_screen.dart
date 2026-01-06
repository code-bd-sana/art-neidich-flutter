import 'package:artneidich_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widget/create_job.dart';
import '../../../constants/text_font_style.dart';
import '../widgets/data_table_widget.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({super.key});

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 1.sw,
              height: 180.h,
              color: Color(0xFF2D8D7C),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    spacing: 30.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Jobs",
                            style: TextFontStyle.headLine28c3D3D3DInterW700
                                .copyWith(fontSize: 18.sp, color: Colors.white),
                          ),

                          PopupMenuButton<String>(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(10),
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                            icon: Icon(Icons.more_vert, color: Colors.white),
                            onSelected: (value) {
                              if (value == 'this_month') {
                              } else if (value == 'previous_month') {
                              } else {}
                            },
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 'this_month',
                                child: Text('This Month'),
                              ),
                              PopupMenuItem(
                                value: 'previous_month',
                                child: Text('Previous Month'),
                              ),
                              PopupMenuItem(
                                value: 'custom',
                                child: Text('Custom'),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Row(
                        spacing: 10.w,
                        children: [
                          Image.asset(
                            Assets.images.jobsIcon.path,
                            width: 40.w,
                            height: 40.h,
                            fit: BoxFit.cover,
                          ),

                          Text(
                            "Manage Jobs",
                            style: TextFontStyle.headLine28c3D3D3DInterW700
                                .copyWith(fontSize: 18.sp, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            DataTableWidget(),

            // UIHelper.verticalSpace(20.h),

            // Row(
            //   children: [
            //     Image.asset(
            //       Assets.icons.filter.path,
            //       width: 20.w,
            //       height: 20.h,
            //     ),
            //     Image.asset(
            //       Assets.icons.search.path,
            //       width: 20.w,
            //       height: 20.h,
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
      floatingActionButton: CreateJob(),
    );
  }
}
