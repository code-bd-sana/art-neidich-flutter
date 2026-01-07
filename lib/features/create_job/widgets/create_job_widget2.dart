import 'package:artneidich_app/common_widget/custom_button.dart';
import 'package:artneidich_app/common_widget/custom_text_field.dart';
import 'package:artneidich_app/constants/validation.dart';
import 'package:artneidich_app/gen/assets.gen.dart';
import 'package:artneidich_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/text_font_style.dart';

class CreateJobWidget2 extends StatefulWidget {
  final Function() nextScreen;
  const CreateJobWidget2({super.key, required this.nextScreen});

  @override
  State<CreateJobWidget2> createState() => _CreateJobWidget2State();
}

class _CreateJobWidget2State extends State<CreateJobWidget2> {
  // Agreed controller

  final _fhaCaseDetailsController = TextEditingController();
  final _orderIdController = TextEditingController();
  final _adressController = TextEditingController();
  final _developermentController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();

    _fhaCaseDetailsController.dispose();
    _orderIdController.dispose();
    _adressController.dispose();
    _developermentController.dispose();
    _nameController.dispose();
    _emailontroller.dispose();
    _phoneController.dispose();
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
                "FHA Case Details",
                style: TextFontStyle.headLine14c323539InterW400,
              ),
              UIHelper.verticalSpace(10.h),
              CustomTextField(
                controller: _fhaCaseDetailsController,
                style: TextFontStyle.headLine14c323539InterW400.copyWith(
                  color: Color(0xFF71717A),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "FHA case is required";
                  }
                  return null;
                },
              ),

              UIHelper.verticalSpace(12.h),

              // order id
              Text("Order ID", style: TextFontStyle.headLine14c323539InterW400),
              UIHelper.verticalSpace(10.h),
              CustomTextField(
                controller: _orderIdController,
                style: TextFontStyle.headLine14c323539InterW400.copyWith(
                  color: Color(0xFF71717A),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Order Id is required";
                  }
                  return null;
                },
              ),

              // Stress Address
              UIHelper.verticalSpace(12.h),

              Text(
                "Street Address",
                style: TextFontStyle.headLine14c323539InterW400,
              ),
              UIHelper.verticalSpace(10.h),
              CustomTextField(
                controller: _adressController,
                style: TextFontStyle.headLine14c323539InterW400.copyWith(
                  color: Color(0xFF71717A),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Street address is required";
                  }
                  return null;
                },
              ),

              UIHelper.verticalSpace(12.h),

              // Developemnt
              Text(
                "Development",
                style: TextFontStyle.headLine14c323539InterW400,
              ),
              UIHelper.verticalSpace(10.h),
              CustomTextField(
                controller: _developermentController,
                style: TextFontStyle.headLine14c323539InterW400.copyWith(
                  color: Color(0xFF71717A),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Devlopment is required";
                  }
                  return null;
                },
              ),

              UIHelper.verticalSpace(12.h),

              // Name
              Text(
                "Site Contact Name",
                style: TextFontStyle.headLine14c323539InterW400,
              ),
              UIHelper.verticalSpace(10.h),
              CustomTextField(
                controller: _nameController,
                style: TextFontStyle.headLine14c323539InterW400.copyWith(
                  color: Color(0xFF71717A),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name is required";
                  }
                  return null;
                },
              ),

              UIHelper.verticalSpace(12.h),

              // Phone
              Text("Phone", style: TextFontStyle.headLine14c323539InterW400),
              UIHelper.verticalSpace(10.h),
              CustomTextField(
                textInputAction: TextInputAction.next,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: _phoneController,
                style: TextFontStyle.headLine14c323539InterW400.copyWith(
                  color: Color(0xFF71717A),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Phone is required";
                  }
                  return null;
                },
              ),

              UIHelper.verticalSpace(12.h),

              // Email
              Text("Email", style: TextFontStyle.headLine14c323539InterW400),
              UIHelper.verticalSpace(10.h),
              CustomTextField(
                controller: _emailontroller,
                style: TextFontStyle.headLine14c323539InterW400.copyWith(
                  color: Color(0xFF71717A),
                ),
                validator: emailValidation,
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

              UIHelper.verticalSpaceExtraLarge,
            ],
          ),
        ),
      ),
    );
  }
}
