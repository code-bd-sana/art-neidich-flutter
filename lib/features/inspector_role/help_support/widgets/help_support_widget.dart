import 'dart:io';

import 'package:artneidich_app/helpers/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../helpers/all_routes.dart';
import '../../../../helpers/navigation_service.dart';
import '../../../../helpers/ui_helpers.dart';
import 'help_support_tile_widegt.dart';

class HelpSupportWidget extends StatelessWidget {
  const HelpSupportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Inspector Guideline
        UIHelper.verticalSpace(10.h),
        Divider(color: Color(0xFFEFEFF1), thickness: 1.5),
        UIHelper.verticalSpace(10.h),
        HelpSettingsTitleWidget(
          title: 'Inspection Guidelines',
          icon: Assets.icons.frame15.path,
          icon2: Assets.icons.download.path,
          onPressed: () async {
       try {
              //  Load PDF from assets
              final byteData = await rootBundle.load(
                'assets/media/bird.pdf',
              );

              // Get app document directory
              final directory = await getApplicationDocumentsDirectory();

              //  Create file path
              final filePath = '${directory.path}/inspection_guidelines.pdf';
              final file = File(filePath);

              //  Write bytes to file (Download)
              await file.writeAsBytes(
                byteData.buffer.asUint8List(
                  byteData.offsetInBytes,
                  byteData.lengthInBytes,
                ),
              );

              // // Share using NEW API
              await SharePlus.instance.share(
                ShareParams(
                  files: [XFile(filePath)],
                  text: 'Inspection Guidelines PDF',
                ),
              );
            } catch (e) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Error: $e')));
            }
          },
        ),
        UIHelper.verticalSpace(10.h),
        Divider(color: Color(0xFFEFEFF1), thickness: 1.5),

        UIHelper.verticalSpace(30.h),

        //
        Text(
          "Support",
          style: TextFontStyle.headLine16c141414InterW400.copyWith(
            color: const Color(0xFF323539),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),

        // Inspector Guideline
        UIHelper.verticalSpace(10.h),
        Divider(color: Color(0xFFEFEFF1), thickness: 1.5),
        UIHelper.verticalSpace(10.h),
        HelpSettingsTitleWidget(
          title: 'Call Office',
          icon: Assets.icons.vector.path,
          icon2: Assets.icons.frame16.path,
          onPressed: () async {
            try {
              final Uri uri = Uri(scheme: 'tel', path: "123456789");
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              } else {
                throw 'Could not open dial pad';
              }
            } catch (e) {
              ToastUtil.showShortToast(e.toString());
            }
          },
        ),
        UIHelper.verticalSpace(10.h),
        Divider(color: Color(0xFFEFEFF1), thickness: 1.5),

        UIHelper.verticalSpace(10.h),
        HelpSettingsTitleWidget(
          title: 'Email Support',
          icon: Assets.icons.frame18.path,
          icon2: Assets.icons.frame17.path,
          onPressed: () {
            NavigationService.navigateTo(Routes.emailSupportScreen);
          },
        ),
        UIHelper.verticalSpace(10.h),
        Divider(color: Color(0xFFEFEFF1), thickness: 1.5),

        // UIHelper.verticalSpace(10.h),
        // HelpSettingsTitleWidget(
        //   title: 'Office Location',
        //   icon: Assets.icons.frame19.path,
        //   icon2: Assets.icons.frame17.path,
        //   onPressed: () {
        //     //  NavigationService.navigateTo(Routes.securityScreen);
        //   },
        // ),
        // UIHelper.verticalSpace(10.h),
        // Divider(color: Color(0xFFEFEFF1), thickness: 1.5),
      ],
    );
  }
}
