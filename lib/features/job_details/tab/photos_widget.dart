import 'dart:developer';

import 'package:artneidich_app/constants/text_font_style.dart';
import 'package:artneidich_app/features/job_details/data/rx_get_report/model/job_report_response.dart';
import 'package:artneidich_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../common_widget/custom_network_image.dart';

class PhotosWidget extends StatelessWidget {
  final List<DataImage> images;
  const PhotosWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: AnimationLimiter(
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: images.length,
          itemBuilder: (_, index) {
            var data = images[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text(
                  data.imageLabel ?? "",
                  style: TextFontStyle.headLine14c323539InterW400,
                ),

                AnimationLimiter(
                  child: GridView.builder(
                    itemCount: data.images?.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      var datum = data.images?[index];

                      log(
                        "Image URL ==========================================: ${datum?.url}",
                      );
                      return AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        columnCount: 2,
                        child: ScaleAnimation(
                          child: FadeInAnimation(
                            child: ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(10.r),
                              child: CustomCachedNetworkImage(
                                imageUrl: datum?.url ?? "",
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                UIHelper.verticalSpace(10.h),
              ],
            );
          },
        ),
      ),
    );
  }
}
