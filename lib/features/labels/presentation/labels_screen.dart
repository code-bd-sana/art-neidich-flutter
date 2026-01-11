import 'package:artneidich_app/common_widget/custom_button.dart';
import 'package:artneidich_app/common_widget/header_widget.dart';
import 'package:artneidich_app/constants/text_font_style.dart';
import 'package:artneidich_app/gen/assets.gen.dart';
import 'package:artneidich_app/helpers/ui_helpers.dart';
import 'package:artneidich_app/provider/label_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../../../common_widget/create_job.dart';
import '../../../common_widget/custom_text_field.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/navigation_service.dart';

class LabelsScreen extends StatefulWidget {
  const LabelsScreen({super.key});

  @override
  State<LabelsScreen> createState() => _LabelsScreenState();
}

class _LabelsScreenState extends State<LabelsScreen> {
  final _formKey = GlobalKey<FormState>();

  final labelnameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    labelnameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LabelProvider>(
      builder: (context, labelProvider, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                HeaderWidget(
                  title: "Labels",
                  icon: Assets.icons.label.path,
                  subtitle: "Total Labels",
                ),

                UIHelper.verticalSpace(20.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: AnimationLimiter(
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: List.generate(labelProvider.labelList.length, (
                        index,
                      ) {
                        var data = labelProvider.labelList[index];
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: ScaleAnimation(
                            child: FadeInAnimation(
                              child: GestureDetector(
                                onLongPress: () {
                                  // Delete Label
                                  Provider.of<LabelProvider>(
                                    context,
                                    listen: false,
                                  ).deleteLabel(index);
                                },
                                onTap: () async {
                                  // set existing label text before opening dialog
                                  labelnameController.text =
                                      labelProvider.labelList[index];

                                  // old value
                                  final oldValue =
                                      labelProvider.labelList[index];
                                  labelnameController.text = oldValue;

                                  // Update Label
                                  await showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadiusGeometry.circular(
                                                10.r,
                                              ),
                                        ),

                                        content: Form(
                                          key: _formKey,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 8.w,
                                              vertical: 8.h,
                                            ),

                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Edit Label Name",
                                                  style: TextFontStyle
                                                      .headLine14c323539InterW400
                                                      .copyWith(
                                                        color: const Color(
                                                          0xFF09090B,
                                                        ),
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),

                                                UIHelper.verticalSpace(8.h),

                                                Text(
                                                  "Label Name",
                                                  style: TextFontStyle
                                                      .headLine14c323539InterW400
                                                      .copyWith(
                                                        color: const Color(
                                                          0xFF323539,
                                                        ),
                                                        fontSize: 14.sp,

                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                ),

                                                UIHelper.verticalSpace(8.h),

                                                CustomTextField(
                                                  maxLines: 5,
                                                  controller:
                                                      labelnameController,
                                                  style: TextFontStyle
                                                      .headLine14c323539InterW400
                                                      .copyWith(
                                                        color: Color(
                                                          0xFF71717A,
                                                        ),
                                                      ),
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return "Label is required";
                                                    } else if (value.trim() ==
                                                        oldValue.trim()) {
                                                      return "Please change the label name before saving";
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                UIHelper.verticalSpace(8.h),

                                                Row(
                                                  spacing: 20.w,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,

                                                  children: [
                                                    Expanded(
                                                      child: CustomButton(
                                                        style: TextFontStyle
                                                            .headLine16c2D8D7CInterW700
                                                            .copyWith(
                                                              color: Color(
                                                                0xFF000000,
                                                              ),
                                                            ),
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              vertical: 6.h,
                                                              horizontal: 10.w,
                                                            ),
                                                        color: Color(
                                                          0xFFF4F4F5,
                                                        ),
                                                        onPressed: () {
                                                          NavigationService
                                                              .goBack;
                                                        },
                                                        text: "Cancel",
                                                      ),
                                                    ),

                                                    Expanded(
                                                      child: CustomButton(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              vertical: 6.h,
                                                              horizontal: 10.w,
                                                            ),
                                                        onPressed: () {
                                                          if (_formKey
                                                              .currentState!
                                                              .validate()) {
                                                            Provider.of<
                                                                  LabelProvider
                                                                >(
                                                                  context,
                                                                  listen: false,
                                                                )
                                                                .updateLabel(
                                                                  index,
                                                                  labelnameController
                                                                      .text,
                                                                );

                                                            NavigationService
                                                                .goBack;
                                                          }
                                                        },
                                                        text: "Update label",
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },

                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.w,
                                    vertical: 6.h,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: const Color(0xFFEFEFF1),
                                  ),
                                  child: Text(
                                    data,
                                    style: TextFontStyle
                                        .headLine14c323539InterW400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),

          floatingActionButton: CreateJob(
            heroTag: "new_label_tag",
            title: 'Create new Label',
            onpressed: () {
              NavigationService.navigateTo(Routes.createLabelScreen);
            },
          ),
        );
      },
    );
  }
}
