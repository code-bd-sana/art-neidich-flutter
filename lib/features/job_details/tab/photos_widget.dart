import 'package:artneidich_app/constants/app_constants.dart';
import 'package:artneidich_app/constants/text_font_style.dart';
import 'package:artneidich_app/helpers/di.dart';
import 'package:artneidich_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../../../common_widget/custom_network_image.dart';
import '../../../provider/job_details_provider.dart';

class PhotosWidget extends StatefulWidget {
  const PhotosWidget({super.key});

  @override
  State<PhotosWidget> createState() => _PhotosWidgetState();
}

class _PhotosWidgetState extends State<PhotosWidget> {
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     log(
  //       "kKeyReportId Photos =====================================> ${appData.read(kKeyReportId)}",
  //     );

  //      log(
  //       "kKeyHasReport Photos =====================================> ${appData.read(kKeyHasReport)}",
  //     );
  //     if (appData.read(kKeyHasReport)) {
  //       context.read<JobDetailsProvider>().fetchReport(
  //         id: appData.read(kKeyReportId),
  //       );
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<JobDetailsProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return Center(
            child: CircularProgressIndicator(color: Color(0xFF2D8D7C)),
          );
        } else if (provider.error != null) {
          return Center(
            child: Text(
              provider.error!,
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else if (provider.data == null) {
          return Center(
            child: Text(
              "Photos not Available ",
              style: TextFontStyle.headLine16c141414InterW400,
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: appData.read(kKeyHasReport)
                ? AnimationLimiter(
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: provider.reportData?.images?.length,
                      itemBuilder: (_, index) {
                        var data = provider.reportData?.images?[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 10,
                          children: [
                            Text(
                              data?.imageLabel ?? "",
                              style: TextFontStyle.headLine14c323539InterW400,
                            ),

                            AnimationLimiter(
                              child: GridView.builder(
                                itemCount: data?.images?.length,
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                    ),
                                itemBuilder: (context, index) {
                                  var datum = data?.images?[index];
                                  return AnimationConfiguration.staggeredGrid(
                                    position: index,
                                    duration: const Duration(milliseconds: 375),
                                    columnCount: 2,
                                    child: ScaleAnimation(
                                      child: FadeInAnimation(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadiusGeometry.circular(
                                                10.r,
                                              ),
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
                  )
                : Center(
                    child: SizedBox(
                      height: 0.5.sh,
                      child: Text(
                        "Photos not available",
                        style: TextFontStyle.headLine14c323539InterW400,
                      ),
                    ),
                  ),
          );
        }
      },
    );
  }
}
