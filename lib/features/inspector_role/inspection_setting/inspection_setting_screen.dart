import 'package:artneidich_app/constants/text_font_style.dart';
import 'package:artneidich_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';
import '../../settings/widgets/settings_title_widget.dart';
import '../widgets/inspector_overview_widget.dart';

class InspectionSettingScreen extends StatefulWidget {
  const InspectionSettingScreen({super.key});

  @override
  State<InspectionSettingScreen> createState() =>
      _InspectionSettingScreenState();
}

class _InspectionSettingScreenState extends State<InspectionSettingScreen> {
  @override
  Widget build(BuildContext context) {
    String name = "Arti";
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InspectorOverviewAppBarWidget(
                email: 'admin@admin.com',
                fName: name,
                name: 'ArtNeidich',
              ),

              UIHelper.verticalSpace(30.h),
              Text(
                "Settings",
                style: TextFontStyle.headLine16c141414InterW400.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                  color: Color(0xFF8E8E93),
                ),
              ),
              UIHelper.verticalSpace(8.h),

              UIHelper.verticalSpace(10.h),
              Divider(color: Color(0xFFEFEFF1), thickness: 1.5),
              UIHelper.verticalSpace(10.h),
              SettingsTitleWidget(
                title: 'Camera Settings',
                icon: Assets.icons.frame12.path,
                onPressed: () {
                  //  NavigationService.navigateTo(Routes.securityScreen);
                },
              ),

              UIHelper.verticalSpace(10.h),
              Divider(color: Color(0xFFEFEFF1), thickness: 1.5),
              UIHelper.verticalSpace(10.h),
              SettingsTitleWidget(
                title: 'Notifications',
                icon: Assets.icons.frame13.path,
                onPressed: () {
                  //    NavigationService.navigateTo(Routes.securityScreen);
                },
              ),

              UIHelper.verticalSpace(10.h),
              Divider(color: Color(0xFFEFEFF1), thickness: 1.5),
              UIHelper.verticalSpace(10.h),
              SettingsTitleWidget(
                title: 'Help & Support',
                icon: Assets.icons.frame14.path,
                onPressed: () {
                  //   NavigationService.navigateTo(Routes.securityScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
