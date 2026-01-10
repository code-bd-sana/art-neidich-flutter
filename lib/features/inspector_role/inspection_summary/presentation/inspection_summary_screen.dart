import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../inspection_view/widgets/inspection_header_widget.dart';
import '../widgets/inspection_contact_widget.dart';
import '../widgets/inspection_details_widget.dart';
import '../widgets/inspection_internal_widget.dart';

class InspectionSummaryScreen extends StatefulWidget {
  const InspectionSummaryScreen({super.key});

  @override
  State<InspectionSummaryScreen> createState() =>
      _InspectionSummaryScreenState();
}

class _InspectionSummaryScreenState extends State<InspectionSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InspectionHeaderWidget(title: "Job Details"),

            UIHelper.verticalSpace(20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                "Job Summary",
                style: TextFontStyle.headLine16c141414InterW400.copyWith(
                  fontWeight: FontWeight.w900,
                  fontSize: 18.sp,
                ),
              ),
            ),

            UIHelper.verticalSpace(20.h),
            InspectionDetailsWidget(title: 'Inspector', value: 'John Doe'),
            UIHelper.verticalSpace(20.h),
            InspectionDetailsWidget(
              title: 'FHA Case Details',
              value: 'John Doe',
            ),
            UIHelper.verticalSpace(20.h),
            InspectionDetailsWidget(title: 'OrderID', value: '8813218R'),
            UIHelper.verticalSpace(20.h),
            InspectionDetailsWidget(title: 'Fee Status', value: 'Standard Fee'),
            UIHelper.verticalSpace(20.h),
            InspectionDetailsWidget(title: 'Agreed Feee', value: '\$150'),
            UIHelper.verticalSpace(20.h),
            InspectionDetailsWidget(
              title: 'Form Type',
              value: 'RCI Residential Building Code Inspection',
            ),
            UIHelper.verticalSpace(20.h),
            InspectionDetailsWidget(
              title: 'Street Address',
              value: '1184 Crestview Drive, San Jose, California 95132',
            ),
            UIHelper.verticalSpace(20.h),
            InspectionDetailsWidget(
              title: 'Development',
              value: 'Histrung Heights',
            ),

            UIHelper.verticalSpace(30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                "Site Contact Information",
                style: TextFontStyle.headLine16c141414InterW400.copyWith(
                  fontWeight: FontWeight.w900,
                  fontSize: 18.sp,
                ),
              ),
            ),

            UIHelper.verticalSpace(20.h),

            InspectionContactCardWidget(
              name: 'John Doe',
              phone: '+123456789',
              email: 'jonh@gmail.com',
            ),

            UIHelper.verticalSpace(20.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                "Submission Details",
                style: TextFontStyle.headLine16c141414InterW400.copyWith(
                  fontWeight: FontWeight.w900,
                  fontSize: 18.sp,
                ),
              ),
            ),

            UIHelper.verticalSpace(16.h),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Submission Status",
                      style: TextFontStyle.headLine16c141414InterW400.copyWith(
                        color: const Color(0xFF848B94),
                        fontSize: 14.sp,

                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  // colon fixed – no Expanded
                  Text(
                    ": ",
                    style: TextFontStyle.headLine16c141414InterW400.copyWith(
                      color: const Color(0xFF848B94),
                      fontSize: 14.sp,

                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  UIHelper.horizontalSpace(20.w),

                  // value comes just after colon
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFDF3D7),

                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 8.h,
                      ),

                      child: Text(
                        "In Progress",
                        style: TextFontStyle.headLine16c141414InterW400
                            .copyWith(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 14.sp,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            UIHelper.verticalSpace(20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                "Internal Notes",
                style: TextFontStyle.headLine16c141414InterW400.copyWith(
                  fontWeight: FontWeight.w900,
                  fontSize: 18.sp,
                ),
              ),
            ),

            UIHelper.verticalSpace(20.h),
            InspectionInternalNotesWidget(
              noteInspector: 'Look for the damages caused by thunder',
              noteAp: 'None',
              formInspector:
                  'Looked for the damages caused by thunder, and found prove of damages in rooftop',
            ),

            UIHelper.verticalSpaceExtraLarge,
          ],
        ),
      ),
    );
  }
}
