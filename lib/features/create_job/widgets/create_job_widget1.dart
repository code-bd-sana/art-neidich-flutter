import 'package:artneidich_app/common_widget/custom_button.dart';
import 'package:artneidich_app/common_widget/custom_drop_down_widget.dart';
import 'package:artneidich_app/common_widget/custom_text_field.dart';
import 'package:artneidich_app/gen/assets.gen.dart';
import 'package:artneidich_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/text_font_style.dart';

class CreateJobWidget1 extends StatefulWidget {
  final Function() nextScreen;
  const CreateJobWidget1({super.key, required this.nextScreen});

  @override
  State<CreateJobWidget1> createState() => _CreateJobWidget1State();
}

class _CreateJobWidget1State extends State<CreateJobWidget1> {
  //Inspector List
  int selectedInspector = -1;

  List<String> inspectorList = [
    "Inspector 1",
    "Inspector 2",
    "Inspector 3",
    "Inspector 4",
  ];

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
  }

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
              CustomDropDownWidget(
                hintText: "Select Inspector",
                items: inspectorList,
                value: selectedInspector == -1 ? null : selectedInspector,

                validator: (value) {
                  if (value == null) return "Inspector is required";
                  return null;
                },

                onChanged: (value) {
                  setState(() {
                    selectedInspector = value!;
                  });
                },
              ),

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
