import 'package:artneidich_app/common_widget/header_widget.dart';
import 'package:artneidich_app/gen/assets.gen.dart';
import 'package:artneidich_app/provider/camera_setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../helpers/ui_helpers.dart';

class CameraSettingScreen extends StatefulWidget {
  const CameraSettingScreen({super.key});

  @override
  State<CameraSettingScreen> createState() => _CameraSettingScreenState();
}

class _CameraSettingScreenState extends State<CameraSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWidget(
              title: "Settings",
              icon: Assets.icons.camera.path,
              subtitle: 'Camera Settings',
            ),

            UIHelper.verticalSpace(30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Force Landscape Mode",
                    style: TextFontStyle.headLine16c141414InterW400.copyWith(
                      color: const Color(0xFF323539),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  Consumer<CameraSettingProvider>(
                    builder: (context, cameraSettingProvider, child) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: AdvancedSwitch(
                          activeColor: Color(0xFF2D8D7C),
                          controller: cameraSettingProvider.controller,
                          onChanged: (value) {
                            cameraSettingProvider.toggleUpdateCamera(value);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            UIHelper.verticalSpaceExtraLarge,
          ],
        ),
      ),
    );
  }
}
