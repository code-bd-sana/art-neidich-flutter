import 'package:artneidich_app/helpers/toast.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../common_widget/create_job.dart';
import '../../../common_widget/custom_button.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/navigation_service.dart';
import '../../../helpers/ui_helpers.dart';
import '../../../provider/inspection_provider.dart';
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

  @override
  Widget build(BuildContext context) {
    return Consumer<InspectionProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                // Top bar menu
                Container(
                  width: 1.sw,
                  height: 180.h,
                  color: Color(0xFF2D8D7C),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: SafeArea(
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
                                    .copyWith(
                                      fontSize: 18.sp,
                                      color: Colors.white,
                                    ),
                              ),

                              PopupMenuButton<String>(
                                padding: EdgeInsets.zero,
                                menuPadding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    10,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(10.r),
                                icon: Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                ),
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
                                              primary: Color(0xFF2D8D7C),
                                              onPrimary: Colors.white,
                                              onSurface: Colors.black,
                                            ),
                                            textButtonTheme:
                                                TextButtonThemeData(
                                                  style: TextButton.styleFrom(
                                                    foregroundColor: Color(
                                                      0xFF2D8D7C,
                                                    ),
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
                                    .copyWith(
                                      fontSize: 18.sp,
                                      color: Colors.white,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 0.55.sh,
                  child: provider.datum.isEmpty
                      ? Center(child: Text("No Data Found"))
                      : DataTable2(
                          headingRowColor: WidgetStateProperty.all(
                            Color(0xFFFAF7F8),
                          ),
                          dataRowColor: WidgetStateProperty.resolveWith(
                            (states) => Colors.white,
                          ),
                          //  empty: Center(child: Text("No Data Found")),
                          border: TableBorder.all(color: Color(0xFFEFEFF1)),

                          scrollController: provider.scrollController,
                          columnSpacing: 20,
                          horizontalMargin: 16,
                          dataRowHeight: 56,
                          headingRowHeight: 56,
                          minWidth: 1600,
                          columns: provider.dataColumeList
                              .map(
                                (e) => DataColumn2(
                                  tooltip: e,
                                  size: ColumnSize.L,
                                  label: Text(
                                    textAlign: TextAlign.center,
                                    e,
                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.visible,
                                    style: TextFontStyle
                                        .headLine16c141414InterW400,
                                  ),
                                ),
                              )
                              .toList(),
                          rows: List.generate(
                            provider.datum.length +
                                (provider.isLoading ? 1 : 0),
                            (index) {
                              //  Loader Row
                              if (index == provider.datum.length) {
                                return DataRow2(
                                  cells: List.generate(
                                    provider.dataColumeList.length,
                                    (i) => i == 0
                                        ? DataCell(
                                            Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(8.r),
                                                child:
                                                    CircularProgressIndicator(
                                                      color: Color(0xFF2D8D7C),
                                                    ),
                                              ),
                                            ),
                                          )
                                        : const DataCell(SizedBox()),
                                  ),
                                );
                              }

                              final item = provider.datum[index];
                              return DataRow(
                                cells: [
                                  DataCell(Text(item.fhaCaseDetailsNo ?? "-")),
                                  DataCell(Text(item.orderId ?? "-")),
                                  DataCell(Text(item.streetAddress ?? "-")),
                                  DataCell(
                                    Text(
                                      "${item.inspector?.firstName ?? "-"} ${item.inspector?.lastName ?? "-"}",
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      item.dueDate != null
                                          ? DateFormat(
                                              'dd-MM-yyyy',
                                            ).format((item.dueDate!).toLocal())
                                          : '-',
                                    ),
                                  ),

                                  DataCell(
                                    Text(
                                      item.dueDate != null
                                          ? DateFormat('dd-MM-yyyy').format(
                                              (item.updatedAt!).toLocal(),
                                            )
                                          : '-',
                                    ),
                                  ),

                                  DataCell(
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.w,
                                        vertical: 6.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: item.reportStatus == "submitted"
                                            ? Color(0xFFECFFEB)
                                            : item.reportStatus == "in_progress"
                                            ? Color(0xFFFDF3D7)
                                            : item.reportStatus == "completed"
                                            ? Color(0xFFEBECFF)
                                            : Color(0xFFFFEBEB),

                                        borderRadius: BorderRadius.circular(
                                          6.r,
                                        ),
                                      ),
                                      child: Text(
                                        item.reportStatus == "submitted"
                                            ? "Submitted"
                                            : item.reportStatus == "in_progress"
                                            ? "In Progress"
                                            : item.reportStatus == "completed"
                                            ? "Completed"
                                            : "Rejected",

                                        style: TextFontStyle
                                            .headLine14c323539InterW400
                                            .copyWith(
                                              color:
                                                  item.reportStatus ==
                                                      "submitted"
                                                  ? Color(0xFF00B21A)
                                                  : item.reportStatus ==
                                                        "in_progress"
                                                  ? Color(0xFF83750C)
                                                  : item.reportStatus ==
                                                        "completed"
                                                  ? Color(0xFF2600B2)
                                                  : Color(0xFFCA4139),
                                            ),
                                      ),
                                    ),
                                  ),

                                  DataCell(
                                    InkWell(
                                      onTap: () {
                                        NavigationService.navigateToWithArgs(
                                          Routes.jobDetailsScreen,
                                          {"id": item.id},
                                        );
                                      },
                                      borderRadius: BorderRadius.circular(6.r),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12.w,
                                          vertical: 6.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.blue.withValues(
                                            alpha: 0.1,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            6.r,
                                          ),
                                        ),
                                        child: Row(
                                          spacing: 4.w,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "View Details",
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),

                                            Image.asset(
                                              Assets.icons.arrowRightIcon.path,
                                              width: 16.w,
                                              height: 16.h,
                                              color: Colors.blue,
                                              fit: BoxFit.cover,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                ),

                UIHelper.verticalSpace(40.h),

                Divider(color: Color(0xFFEFEFF1), thickness: 1.5),
              ],
            ),
          ),

          // FLoat
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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

                                      DropdownButtonFormField2<String>(
                                        isExpanded: true,
                                        hint: Text(
                                          "Selected Filter",
                                          style: TextFontStyle
                                              .headLine16c888888InterBold
                                              .copyWith(
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                        items: provider.filterList
                                            .map(
                                              (
                                                item,
                                              ) => DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style: TextFontStyle
                                                      .headLine16c888888InterBold,
                                                ),
                                              ),
                                            )
                                            .toList(),

                                        value:
                                            (provider.selectedFilter == null ||
                                                provider
                                                    .selectedFilter!
                                                    .isEmpty)
                                            ? null
                                            : provider.selectedFilter,
                                        validator: (value) {
                                          if (value == null) {
                                            return "Filter is required";
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          if (value != null) {
                                            provider.filterToggle(value);
                                          }
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
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
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
                                          if (provider.selectedFilter == null) {
                                            ToastUtil.showShortToast(
                                              "Please select an Item",
                                            );
                                          } else {
                                            NavigationService.goBack;
                                          }
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

                    // Search
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
                              provider: provider,
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
      },
    );
  }
}
