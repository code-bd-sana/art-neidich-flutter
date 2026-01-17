import 'package:artneidich_app/gen/assets.gen.dart';
import 'package:artneidich_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/text_font_style.dart';
import '../../../provider/job_details_provider.dart';

class ReportWidget extends StatelessWidget {
  final JobDetailsProvider provider;
  const ReportWidget({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            "Report",
            style: TextFontStyle.headLine16c141414InterW400.copyWith(
              fontWeight: FontWeight.w900,
              fontSize: 18.sp,
            ),
          ),
        ),

        UIHelper.verticalSpace(20.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Download",
                style: TextFontStyle.headLine16c141414InterW400.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),

              Text(
                ":",
                style: TextFontStyle.headLine16c141414InterW400.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),

              Text(
                "${provider.reportData?.inspector?.firstName ?? ""} ${provider.reportData?.inspector?.lastName ?? ""}",
                style: TextFontStyle.headLine16c141414InterW400.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),

              Image.asset(
                Assets.icons.download.path,
                width: 20.w,
                height: 20.h,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
