import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/text_font_style.dart';
import '../../../helpers/ui_helpers.dart';
import '../widgets/contact_card_widget.dart';
import '../widgets/internal_note_widget.dart';
import '../widgets/job_details_widget.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        JobDetailsWidget(title: 'Inspector', value: 'John Doe'),
        UIHelper.verticalSpace(20.h),
        JobDetailsWidget(title: 'FHA Case Details', value: 'John Doe'),
        UIHelper.verticalSpace(20.h),
        JobDetailsWidget(title: 'OrderID', value: '8813218R'),
        UIHelper.verticalSpace(20.h),
        JobDetailsWidget(title: 'Fee Status', value: 'Standard Fee'),
        UIHelper.verticalSpace(20.h),
        JobDetailsWidget(title: 'Agreed Feee', value: '\$150'),
        UIHelper.verticalSpace(20.h),
        JobDetailsWidget(
          title: 'Form Type',
          value: 'RCI Residential Building Code Inspection',
        ),
        UIHelper.verticalSpace(20.h),
        JobDetailsWidget(
          title: 'Street Address',
          value: '1184 Crestview Drive, San Jose, California 95132',
        ),
        UIHelper.verticalSpace(20.h),
        JobDetailsWidget(title: 'Development', value: 'Histrung Heights'),

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

        ContactCardWidget(
          name: 'John Doe',
          phone: '+123456789',
          email: 'jonh@gmail.com',
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
        InternalNotesWidget(
          noteInspector: 'Look for the damages caused by thunder',
          noteAp: 'None',
          formInspector:
              'Looked for the damages caused by thunder, and found prove of damages in rooftop',
        ),
      ],
    );
  }
}
