import 'package:artneidich_app/constants/text_font_style.dart';
import 'package:artneidich_app/helpers/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../provider/inspector_progress_provider.dart';

class MediaWidget extends StatelessWidget {
  final InspectorProgressProvider provider;
  final int labelIndex;
    final int imageIndex;
  const MediaWidget({
    super.key,
    required this.provider,
    required this.labelIndex,
        required this.imageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
      ),
      child: Column(
        spacing: 4.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              NavigationService.goBack;
              provider.pickedImage(
                labelIndex: labelIndex,
                imageIndex: imageIndex,
                imageSource: ImageSource.camera,
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 10.w,
              children: [
                Icon(Icons.camera_alt, size: 24.sp),
                Text(
                  "Camera",
                  style: TextFontStyle.headLine14c323539InterW400.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Divider(color: Colors.black, thickness: 0.2),

          GestureDetector(
            onTap: () {
              NavigationService.goBack;
              provider.pickedImage(
                labelIndex: labelIndex,
                imageIndex: imageIndex,
                imageSource: ImageSource.gallery,
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 10.w,
              children: [
                Icon(Icons.photo, size: 24.sp),
                Text(
                  "Gallery",
                  style: TextFontStyle.headLine14c323539InterW400.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
