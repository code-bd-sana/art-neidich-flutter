import 'package:artneidich_app/constants/text_font_style.dart';
import 'package:artneidich_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/expansion__widget.dart';
import 'widgets/notification_bar_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool _isExpanded = false;
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
              NotificationBarWidget(
                email: 'admin@admin.com',
                fName: name,
                name: 'ArtNeidich',
              ),

              UIHelper.verticalSpace(30.h),
              Text(
                "Notification",
                style: TextFontStyle.headLine16c141414InterW400.copyWith(
                  color: const Color(0xFF8E8E93),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              UIHelper.verticalSpace(8.h),

              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (_, index) {
                  return ExpansionTileWidget();
                },
              ),

              UIHelper.verticalSpace(20.h),
            ],
          ),
        ),
      ),
    );
  }
}
