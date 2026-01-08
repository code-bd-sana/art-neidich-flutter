import 'package:artneidich_app/constants/text_font_style.dart';
import 'package:artneidich_app/gen/assets.gen.dart';
import 'package:artneidich_app/helpers/all_routes.dart';
import 'package:artneidich_app/helpers/navigation_service.dart';
import 'package:artneidich_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common_widget/settings_bar_widget.dart';
import 'widgets/settings_title_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),

        padding: EdgeInsets.symmetric(horizontal: 20.w),

        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SettingAppBarWidget(
                email: 'admin@admin.com',
                fName: "name",
                name: 'ArtNeidich',
              ),

              UIHelper.verticalSpace(30.h),
              Text(
                "Settings",
                style: TextFontStyle.headLine14c323539InterW400.copyWith(
                  color: const Color(0xFF8E8E93),
                  fontSize: 13.sp,

                  fontWeight: FontWeight.w500,
                ),
              ),

              UIHelper.verticalSpace(20.h),

              Divider(color: Color(0xFFEFEFF1), thickness: 1.5),
              UIHelper.verticalSpace(10.h),
              SettingsTitleWidget(
                title: 'Profile',
                icon: Assets.icons.frame1.path,
                onPressed: () {
                  NavigationService.navigateTo(Routes.profileScreen);
                },
              ),
              UIHelper.verticalSpace(10.h),
              Divider(color: Color(0xFFEFEFF1), thickness: 1.5),
              UIHelper.verticalSpace(10.h),
              SettingsTitleWidget(
                title: 'Security & Permissions',
                icon: Assets.icons.frame2.path,
                onPressed: () {

                   NavigationService.navigateTo(Routes.securityScreen);

                  
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
