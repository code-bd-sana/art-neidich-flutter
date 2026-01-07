import 'package:artneidich_app/common_widget/create_job.dart';
import 'package:artneidich_app/gen/assets.gen.dart';
import 'package:artneidich_app/helpers/ui_helpers.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widget/custom_button.dart';
import '../../../constants/text_font_style.dart';
import '../../../helpers/navigation_service.dart';
import '../widgets/data_table_widget.dart';
import '../widgets/search_bottom_widget.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({super.key});

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _searchController.dispose();
  }

  final List<String> filterList = [
    "Assigned",
    "In Progress",
    "Submitted",
    "Overdue",
  ];

  int selectedRole = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 1.sw,
              height: 200.h,
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

            // Data Table Widget is here
            DataTableWidget(),
          ],
        ),
      ),

      floatingActionButton: SizedBox(
        width: 1.sw,
        child: Row(
          children: [
            // LEFT ICONS
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 32.w),
                  child: InkWell(
                    onTap: () async {
                      await showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.only(
                            topLeft: Radius.circular(16.r),
                            topRight: Radius.circular(16.r),
                          ),
                        ),
                        context: context,
                        builder: (_) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 16.h,
                            ),
                            height: 0.28.sh,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusGeometry.only(
                                topLeft: Radius.circular(16.r),
                                topRight: Radius.circular(16.r),
                              ),
                            ),

                            child: SafeArea(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Filter",
                                    style: TextFontStyle
                                        .headLine16c141414InterW400
                                        .copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13.sp,
                                          color: Color(0xFF000000),
                                        ),
                                  ),

                                  UIHelper.verticalSpace(10.h),


                                    DropdownButtonFormField2<int>(
                                    isExpanded: true,
                                    hint: Text(
                                      "Select Role",
                                      style: TextFontStyle
                                          .headLine16c888888InterBold
                                          .copyWith(
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                    items: List.generate(
                                      filterList.length,
                                      (index) => DropdownMenuItem<int>(
                                        value: index,
                                        child: Text(
                                          filterList[index],
                                          style: TextFontStyle
                                              .headLine16c888888InterBold,
                                        ),
                                      ),
                                    ),
                                    value: selectedRole == -1
                                        ? null
                                        : selectedRole,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Role is required";
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        selectedRole = value!;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0xFFEFEFF1),

                                      // normal border
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          8.r,
                                        ),
                                        borderSide: BorderSide.none,
                                      ),

                                      // error border
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          8.r,
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                          width: 1.5.w,
                                        ),
                                      ),

                                      // focused error border
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          8.r,
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                          width: 1.5,
                                        ),
                                      ),
                                    ),
                                  ),

                                  UIHelper.verticalSpace(30.h),

                                  CustomButton(
                                    onPressed: () {
                                      NavigationService.goBack;
                                    },
                                    text: "Apply",
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Image.asset(
                      Assets.icons.filter.path,
                      width: 32.w,
                      height: 32.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                UIHelper.horizontalSpace(16.w),

                InkWell(
                  onTap: () async {
                    await showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.only(
                          topLeft: Radius.circular(16.r),
                          topRight: Radius.circular(16.r),
                        ),
                      ),
                      context: context,
                      builder: (_) {
                        return ShowSearchBottomWidget(
                          search: _searchController,
                        );
                      },
                    );
                  },
                  child: Image.asset(
                    Assets.icons.search.path,
                    width: 32.w,
                    height: 32.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),

            Spacer(),

            // RIGHT FAB
             CreateJob(heroTag: "job_screen_tag",),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
