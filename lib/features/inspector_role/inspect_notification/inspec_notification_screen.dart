import 'package:artneidich_app/common_widget/header_widget.dart';
import 'package:artneidich_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../provider/push_notification_provider.dart';

class InspectNotificationScreen extends StatefulWidget {
  const InspectNotificationScreen({super.key});

  @override
  State<InspectNotificationScreen> createState() =>
      _InspectNotificationScreenState();
}

class _InspectNotificationScreenState extends State<InspectNotificationScreen> {
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
              icon: Assets.icons.push.path,
              subtitle: 'Notification',
            ),

            UIHelper.verticalSpace(30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Push Notification",
                    style: TextFontStyle.headLine16c141414InterW400.copyWith(
                      color: const Color(0xFF323539),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  Consumer<PushNotificationProvider>(
                    builder: (context, pushNotificationProvider, child) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: AdvancedSwitch(
                          activeColor: Color(0xFF2D8D7C),
                          controller: pushNotificationProvider.pushController,
                          onChanged: (value) {
                            pushNotificationProvider.toggleUpdatePush(value);
                          },
                        ),
                      );
                    },
                  ),

                  // Due Date
                ],
              ),
            ),

            UIHelper.verticalSpace(30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Due Date Reminders",
                    style: TextFontStyle.headLine16c141414InterW400.copyWith(
                      color: const Color(0xFF323539),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  Consumer<PushNotificationProvider>(
                    builder: (context, pushNotificationProvider, child) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: AdvancedSwitch(
                          activeColor: Color(0xFF2D8D7C),
                          controller:
                              pushNotificationProvider.dueDateController,
                          onChanged: (value) {
                            pushNotificationProvider.toggleUpdateDueDate(value);
                          },
                        ),
                      );
                    },
                  ),

                  // Due Date
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
