import 'package:artneidich_app/constants/text_font_style.dart';
import 'package:artneidich_app/gen/assets.gen.dart';
import 'package:artneidich_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsTitleWidget extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onPressed;
  const SettingsTitleWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          
          Image.asset(icon, width: 20.w, height: 20.h, fit: BoxFit.cover),
          UIHelper.horizontalSpace(20.w),
          Text(title, style: TextFontStyle.headLine14c323539InterW400),
      
          Spacer(),
      
         Image.asset(
            Assets.icons.frame4.path,
            width: 20.w,
            height: 20.h,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
