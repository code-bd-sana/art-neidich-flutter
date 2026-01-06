import 'package:artneidich_app/constants/text_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityWidget extends StatelessWidget {
  final String fName;
  final String jobId;
  final String status;
  final String time;
  const ActivityWidget({
    super.key,
    required this.fName,
    required this.jobId,
    required this.status,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey.shade400,
          child: Text(fName.trim().split(' ').first[0]),
        ),

        Column(
          spacing: 4.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              jobId,
              style: TextFontStyle.headLine16c141414InterW400.copyWith(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              status,
              style: TextFontStyle.headLine16c141414InterW400.copyWith(
                color: Colors.black,
                fontSize: 13.sp,
              ),
            ),

            Text(
              time,
              style: TextFontStyle.headLine16c141414InterW400.copyWith(
                color: Colors.grey,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
