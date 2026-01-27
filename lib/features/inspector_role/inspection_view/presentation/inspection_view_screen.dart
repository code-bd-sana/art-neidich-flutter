import 'package:artneidich_app/common_widget/create_job.dart';
import 'package:artneidich_app/gen/assets.gen.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../helpers/all_routes.dart';
import '../../../../helpers/navigation_service.dart';
import '../../../../provider/assign_inspector_provider.dart';
import '../widgets/inspection_header_widget.dart';
import '../widgets/inspecttion_viewsearch_bottom_widget.dart';

class InspectionViewScreen extends StatefulWidget {
  const InspectionViewScreen({super.key});

  @override
  State<InspectionViewScreen> createState() => _InspectionViewScreenState();
}

class _InspectionViewScreenState extends State<InspectionViewScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AssignInspectorProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: RefreshIndicator(
              onRefresh: () async {
                provider.resetData();
              },
              child: Column(
                children: [
                  // Header AppBar Widget
                  InspectionHeaderWidget(title: "Assigned Inspections"),

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
                            minWidth: 1200,
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
                                                        color: Color(
                                                          0xFF2D8D7C,
                                                        ),
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
                                    DataCell(
                                      Text(item.fhaCaseDetailsNo ?? "-"),
                                    ),
                                    DataCell(Text(item.orderId ?? "-")),

                                    DataCell(
                                      Text(
                                        item.dueDate != null
                                            ? DateFormat('dd-MM-yyyy').format(
                                                (item.dueDate!).toLocal(),
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
                                          color:
                                              item.reportStatus == "submitted"
                                              ? Color(0xFFECFFEB)
                                              : item.reportStatus ==
                                                    "in_progress"
                                              ? Color(0xFFFDF3D7)
                                              : item.reportStatus == "completed"
                                              ? Color(0xFFEBECFF)
                                              : Color(0xFFFFEBEB),

                                          borderRadius: BorderRadius.circular(
                                            6.r,
                                          ),
                                        ),
                                        child: Text(
                                          item.reportStatusLabel ?? "",

                                          // item.reportStatus == "submitted"
                                          //     ? "Submitted"
                                          //     : item.reportStatus ==
                                          //           "in_progress"
                                          //     ? "In Progress"
                                          //     : item.reportStatus == "completed"
                                          //     ? "Completed"
                                          //     : "Rejected",
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

                                    item.reportStatusLabel == "In Progress"
                                        ? DataCell(
                                            InkWell(
                                              onTap: () {
                                                NavigationService.navigateToWithArgs(
                                                  Routes.inspectionLabelScreen,
                                                  {
                                                    "labelType":
                                                        "startInspector",
                                                    "datum": item,
                                                  },
                                                );
                                              },
                                              borderRadius:
                                                  BorderRadius.circular(6.r),
                                              child: Row(
                                                spacing: 4.w,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Start Inspector",
                                                    style: TextStyle(
                                                      color: Color(0xFF0097B2),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),

                                                  Image.asset(
                                                    Assets
                                                        .icons
                                                        .arrowRightIcon
                                                        .path,
                                                    width: 16.w,
                                                    height: 16.h,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        : DataCell(SizedBox.shrink()),

                                    DataCell(
                                      InkWell(
                                        onTap: () {
                                          NavigationService.navigateToWithArgs(
                                            Routes.inspectionSummaryScreen,
                                            {"datum": item},
                                          );
                                        },
                                        borderRadius: BorderRadius.circular(
                                          6.r,
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            // horizontal: 12.w,
                                            vertical: 6.h,
                                          ),

                                          child: Row(
                                            spacing: 4.w,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "View Details",
                                                style: TextStyle(
                                                  color: Color(0xFFFF7F60),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),

                                              Image.asset(
                                                Assets
                                                    .icons
                                                    .arrowRightIcon
                                                    .path,
                                                width: 16.w,
                                                height: 16.h,
                                                color: Color(0xFFFF7F60),
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
                ],
              ),
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
                              return InspectionViewShowSearchBottomWidget(
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
                    ),
                  ],
                ),

                Spacer(),

                // RIGHT FAB
                CreateJob(
                  heroTag: "inpectionview_screen_tag",
                  title: 'Start Inspection',
                  onpressed: () {
                    NavigationService.navigateTo(Routes.inspectionIdScreen);
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
