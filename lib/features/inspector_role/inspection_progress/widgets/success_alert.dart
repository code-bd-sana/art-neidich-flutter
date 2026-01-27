import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common_widget/custom_button.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../helpers/navigation_service.dart';
import '../../../../provider/inspector_progress_provider.dart';

class SuccessAlert extends StatelessWidget {
  final InspectorProgressProvider provider;

  final TextEditingController controller;
  const SuccessAlert({
    super.key,
    required this.provider,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 8.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Inspection successfully completed",
            style: TextFontStyle.headLine14c323539InterW400.copyWith(
              color: const Color(0xFF09090B),
              fontSize: 16.sp,

              fontWeight: FontWeight.w600,
            ),
          ),

          Text(
            "Congrats! the assigned job successfully completed. ",
            style: TextFontStyle.headLine14c323539InterW400.copyWith(
              color: const Color(0xFF71717A),
              fontSize: 14.sp,

              fontWeight: FontWeight.w400,
            ),
          ),

          Row(
            spacing: 16.w,
            children: [
              Expanded(
                child: CustomButton(
                  color: Color(0xFFF4F4F5),
                  onPressed: () {
                    NavigationService.goBack;
                  },
                  style: TextFontStyle.headLine16c2D8D7CInterW700.copyWith(
                    color: const Color(0xFF09090B),
                    fontSize: 14.sp,

                    fontWeight: FontWeight.w500,
                  ),
                  text: "Close",
                ),
              ),

              Expanded(
                flex: 2,
                child: CustomButton(
                  onPressed: () {
                    NavigationService.goBack;

                    provider.clearAllData();
                    controller.clear();
                  },

                  text: "Start Inspection",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
