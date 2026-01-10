import 'package:artneidich_app/common_widget/create_job.dart';
import 'package:artneidich_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../helpers/all_routes.dart';
import '../../../../helpers/navigation_service.dart';
import '../widgets/inspection_header_widget.dart';
import '../widgets/inspection_viewdata_table_widget.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header AppBar Widget
            InspectionHeaderWidget(title: "Assigned Inspections"),

            // Data Table Widget is here
            InspectionViewDataTableWidget(),
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
                          return InspectionViewShowSearchBottomWidget(
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
  }
}
