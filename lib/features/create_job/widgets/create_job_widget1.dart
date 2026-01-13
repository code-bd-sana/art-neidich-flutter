import 'package:artneidich_app/common_widget/custom_button.dart';
import 'package:artneidich_app/common_widget/custom_drop_down_widget.dart';
import 'package:artneidich_app/common_widget/custom_text_field.dart';
import 'package:artneidich_app/gen/assets.gen.dart';
import 'package:artneidich_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../constants/text_font_style.dart';
import '../../../provider/create_job_provider.dart';

class CreateJobWidget1 extends StatefulWidget {
  final Function() nextScreen;
  const CreateJobWidget1({super.key, required this.nextScreen});

  @override
  State<CreateJobWidget1> createState() => _CreateJobWidget1State();
}

class _CreateJobWidget1State extends State<CreateJobWidget1> {
  // Form Type
  int selectedFormType = -1;

  List<String> formList = [
    "RCI Residential Building Code Inspection",
    "Unknown",
  ];

  // Feee Status

  // Form Type
  int selectedFeeStatus = -1;

  List<String> feeStatusList = [
    "Standard",
    "Rush Order",
    "Occupied Fee",
    "Modified Fee",
    "Long Distance Fee",
  ];

  // Agreed controller
  final _agreeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();

    _agreeController.dispose();
    _scrollController.dispose();
  }

  //String? selectedValue;
  List<String> items = ["A", "B", "C"];

  int currentPage = 1;
  bool isLoading = false;
  final ScrollController _scrollController = ScrollController();

  //

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CreateJobProvider>(context, listen: false).fetchUsers();
    });
  }

  final _inspectorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUnfocus,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Inspector",
                style: TextFontStyle.headLine14c323539InterW400,
              ),

              UIHelper.verticalSpace(10.h),

              Consumer<CreateJobProvider>(
                builder: (context, provider, child) {
                  return CustomTextField(
                    controller: _inspectorController,
                    readOnly: true,
                    style: TextFontStyle.headLine14c323539InterW400.copyWith(
                      color: Color(0xFF71717A),
                    ),
                    onTap: () async {
                      await showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        context: context,
                        builder: (_) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                            width: double.infinity,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                    controller: provider.scrollController,
                                   itemCount: provider.isLoading ? provider.users.length + 1 : provider.users.length,

                                    itemBuilder: (_, index) {
                                      if (index < provider.users.length) {
                                        final user = provider.users[index];
                                        return InkWell(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                            _inspectorController.text =
                                                user.firstName ?? ""; // or ID
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 16,
                                            ),
                                            child: Text(user.firstName ?? ""),
                                          ),
                                        );
                                      } else {
                                        // show loader at the bottom
                                        return provider.isLoading
                                            ? Padding(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 16,
                                                ),
                                                child: Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              )
                                            : SizedBox.shrink();
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),

              // Consumer<CreateJobProvider>(
              //   builder: (context, provider, child) {
              //     return CustomTextField(
              //       controller: _inspectorController,
              //       readOnly: true,
              //       style: TextFontStyle.headLine14c323539InterW400.copyWith(
              //         color: Color(0xFF71717A),
              //       ),

              //       onTap: () async {
              //         await showModalBottomSheet(
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadiusGeometry.circular(10.r),
              //           ),
              //           context: context,
              //           builder: (_) {
              //             return Container(
              //               decoration: BoxDecoration(
              //                 border: Border.symmetric(),
              //               ),
              //               padding: EdgeInsets.symmetric(
              //                 horizontal: 16.w,
              //                 vertical: 16.h,
              //               ),
              //               width: 1.sw,
              //               child: ListView.builder(
              //                 controller: provider.scrollController,
              //                 padding: EdgeInsets.zero,
              //                 itemCount: 10,
              //                 shrinkWrap: true,
              //                 itemBuilder: (_, index) {
              //                   return InkWell(
              //                     onTap: () {
              //                       NavigationService.goBack;

              //                       setState(() {
              //                         _inspectorController.text = index
              //                             .toString();
              //                       });
              //                     },
              //                     child: Padding(
              //                       padding: EdgeInsets.symmetric(
              //                         horizontal: 16.w,
              //                         vertical: 16.h,
              //                       ),
              //                       child: Text("Item $index"),
              //                     ),
              //                   );
              //                 },
              //               ),
              //             );
              //           },
              //         );
              //       },
              //     );
              //   },
              // ),
              UIHelper.verticalSpace(12.h),

              Text(
                "Form Type",
                style: TextFontStyle.headLine14c323539InterW400,
              ),

              UIHelper.verticalSpace(10.h),
              CustomDropDownWidget(
                hintText: "Select Type",
                items: formList,
                value: selectedFormType == -1 ? null : selectedFormType,

                validator: (value) {
                  if (value == null) return "Form Type is required";
                  return null;
                },

                onChanged: (value) {
                  setState(() {
                    selectedFormType = value!;
                  });
                },
              ),

              UIHelper.verticalSpace(12.h),

              Text(
                "Fee Status",
                style: TextFontStyle.headLine14c323539InterW400,
              ),

              UIHelper.verticalSpace(10.h),
              CustomDropDownWidget(
                hintText: "Select Fee Type",
                items: feeStatusList,
                value: selectedFeeStatus == -1 ? null : selectedFeeStatus,

                validator: (value) {
                  if (value == null) return "Fee Type is required";
                  return null;
                },

                onChanged: (value) {
                  setState(() {
                    selectedFeeStatus = value!;
                  });
                },
              ),

              UIHelper.verticalSpace(12.h),

              Text(
                "Agreed Status",
                style: TextFontStyle.headLine14c323539InterW400,
              ),

              UIHelper.verticalSpace(10.h),

              CustomTextField(
                controller: _agreeController,
                style: TextFontStyle.headLine14c323539InterW400.copyWith(
                  color: Color(0xFF71717A),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Agreed satus is required";
                  }
                  return null;
                },
              ),

              UIHelper.verticalSpace(20.h),

              Align(
                alignment: Alignment.topRight,
                child: CustomButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      widget.nextScreen();
                    }
                  },
                  borderRadius: 30.r,
                  padding: EdgeInsets.symmetric(
                    horizontal: 32.w,
                    vertical: 12.h,
                  ),
                  minWidth: 0,
                  child: Row(
                    spacing: 10.w,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      Text(
                        "Next",
                        style: TextFontStyle.headLine16c2D8D7CInterW700,
                      ),
                      Image.asset(
                        Assets.icons.arrowRight.path,
                        width: 20.w,
                        height: 20.h,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
