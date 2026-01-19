import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/text_font_style.dart';
import '../../../helpers/ui_helpers.dart';

class EmailLog extends StatelessWidget {
  const EmailLog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            "Email Log",
            style: TextFontStyle.headLine16c141414InterW400.copyWith(
              fontWeight: FontWeight.w900,
              fontSize: 18.sp,
            ),
          ),
        ),

        UIHelper.verticalSpace(20.h),
        // EmailLogWidget(
        //   title: 'Timestamp',
        //   value: DateFormat(
        //     'd MMMM yyyy',
        //   ).format(provider.reportData?.createdAt ?? DateTime.now()),
        //   status: false,
        // ),
        // UIHelper.verticalSpace(20.h),
        // EmailLogWidget(
        //   title: 'Status',
        //   value: provider.reportData?.status ?? "",
        // ),
        // UIHelper.verticalSpace(20.h),
        //  EmailLogWidget(title: 'Message ID', value: '-', status: false),
      ],
    );
  }
}
