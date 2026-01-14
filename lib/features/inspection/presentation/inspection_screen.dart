import 'package:artneidich_app/common_widget/create_job.dart';
import 'package:artneidich_app/gen/assets.gen.dart';
import 'package:artneidich_app/helpers/ui_helpers.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widget/custom_button.dart';
import '../../../constants/text_font_style.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/navigation_service.dart';
import '../widgets/data_table_widget.dart';
import '../widgets/search_bottom_widget.dart';

class InspectionScreen extends StatefulWidget {
  const InspectionScreen({super.key});

  @override
  State<InspectionScreen> createState() => _InspectionScreenState();
}

class _InspectionScreenState extends State<InspectionScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _searchController.dispose();
  }

  final List<String> filterList = [
    "In Progress",
    "Submitted",
    "Completed",
    "Rejected",
  ];

  int selectedFilter = -1;
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
                            onSelected: (value) async {
                              if (value == 'this_month') {
                              } else if (value == 'previous_month') {
                              } else {
                                final DateTime?
                                pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime.now(),

                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.light(
                                          primary: Color(
                                            0xFF2D8D7C,
                                          ), // header background color (top bar)
                                          onPrimary:
                                              Colors.white, // header text color
                                          onSurface:
                                              Colors.black, // body text color
                                        ),
                                        textButtonTheme: TextButtonThemeData(
                                          style: TextButton.styleFrom(
                                            foregroundColor: Color(
                                              0xFF2D8D7C,
                                            ), // "CANCEL"/"OK" button color
                                          ),
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                );

                                if (pickedDate != null) {
                                  setState(() {
                                    // _dateController.text = DateFormat(
                                    //   'dd-MM-yyyy',
                                    // ).format(pickedDate);
                                  });
                                }
                              }
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
                                      "Selected Filter",
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
                                    value: selectedFilter == -1
                                        ? null
                                        : selectedFilter,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Filter is required";
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        selectedFilter = value!;
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
            CreateJob(
              heroTag: "inpection_screen_tag",
              title: 'Create New Job',
              onpressed: () {
                NavigationService.navigateTo(Routes.createJobScreen);
              },
            ),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
