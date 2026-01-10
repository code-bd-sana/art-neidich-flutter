import 'package:artneidich_app/helpers/all_routes.dart';
import 'package:artneidich_app/helpers/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widget/custom_button.dart';
import '../../../common_widget/custom_drop_down_widget.dart';
import '../../../common_widget/header_widget.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../helpers/ui_helpers.dart';

class InspectionCaseScreen extends StatefulWidget {
  const InspectionCaseScreen({super.key});

  @override
  State<InspectionCaseScreen> createState() => _InspectionCaseScreenState();
}

class _InspectionCaseScreenState extends State<InspectionCaseScreen> {
  //Case List
  int selectedInspectorCase = -1;

  List<String> inspectorCaseList = [
    "10123-456789-000",
    "10126-456789-001",
    "10125-456789-002",
    "10124-456789-003",
  ];

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header AppBar Widget
              HeaderWidget(
                title: "Jobs",
                icon: Assets.images.jobsIcon.path,
                subtitle: 'Inspections',
              ),

              UIHelper.verticalSpace(20.h),

              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
                child: Text(
                  "FHA Case Details",
                  style: TextFontStyle.headLine14c323539InterW400,
                ),
              ),
              UIHelper.verticalSpace(8.h),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
                child: CustomDropDownWidget(
                  hintText: "Select Case ID",
                  items: inspectorCaseList,
                  value: selectedInspectorCase == -1
                      ? null
                      : selectedInspectorCase,

                  validator: (value) {
                    if (value == null) return "Case ID is required";
                    return null;
                  },

                  onChanged: (value) {
                    setState(() {
                      selectedInspectorCase = value!;
                    });
                  },
                ),
              ),
              UIHelper.verticalSpace(20.h),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
                child: Align(
                  alignment: Alignment.topRight,
                  child: CustomButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        NavigationService.navigateTo(
                          Routes.inspectionProgressScreen,
                        );
                      }
                    },
                    borderRadius: 30.r,
                    padding: EdgeInsets.symmetric(
                      horizontal: 32.w,
                      vertical: 12.h,
                    ),
                    minWidth: 0,
                    child: Row(
                      spacing: 10.w,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,

                      children: [
                        Text(
                          "Next",
                          style: TextFontStyle.headLine16c2D8D7CInterW700,
                        ),
                        Image.asset(
                          Assets.icons.arrowRight.path,
                          width: 20.w,
                          height: 20.h,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
