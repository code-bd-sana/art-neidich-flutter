import 'dart:developer';

import 'package:artneidich_app/common_widget/custom_text_field.dart';
import 'package:artneidich_app/constants/text_font_style.dart';
import 'package:artneidich_app/helpers/all_routes.dart';
import 'package:artneidich_app/helpers/navigation_service.dart';
import 'package:artneidich_app/helpers/ui_helpers.dart';
import 'package:artneidich_app/provider/role_provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../common_widget/auth_custom_app_bar.dart';
import '../../../common_widget/custom_button.dart';
import '../../../constants/validation.dart';
import '../../../gen/assets.gen.dart';
import '../../../provider/signup_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _firstName.dispose();
    _lastName.dispose();
    _email.dispose();
    _password.dispose();
  }

  List<String> roleList = ["Admin", "Inspector"];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthCustomAppBar(
        titleText: 'SignUp',
        automaticallyImplyLeading: false,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUnfocus,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First Name
              Text(
                "First Name",
                style: TextFontStyle.headLine16c141414InterW400,
              ),
              UIHelper.verticalSpace(4.h),
              CustomTextField(
                controller: _firstName,
                filled: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "First name is required";
                  }
                  return null;
                },
              ),

              UIHelper.verticalSpace(16.h),

              // Last Name
              Text(
                "Last Name",
                style: TextFontStyle.headLine16c141414InterW400,
              ),
              UIHelper.verticalSpace(4.h),
              CustomTextField(
                controller: _lastName,
                filled: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Last name is required";
                  }
                  return null;
                },
              ),

              UIHelper.verticalSpace(16.h),

              Text(
                "Select your Role",
                style: TextFontStyle.headLine16c141414InterW400,
              ),
              UIHelper.verticalSpace(4.h),

              Consumer<RoleProvider>(
                builder: (context, roleProvider, child) {
                  return DropdownButtonFormField2<int>(
                    isExpanded: true,
                    hint: Text(
                      "Select Role",
                      style: TextFontStyle.headLine16c888888InterBold.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    items: List.generate(
                      roleList.length,
                      (index) => DropdownMenuItem<int>(
                        value: index,
                        child: Text(
                          roleList[index],
                          style: TextFontStyle.headLine16c888888InterBold,
                        ),
                      ),
                    ),
                    value: roleProvider.selectedRoleIndex == -1
                        ? null
                        : roleProvider.selectedRoleIndex,
                    //selectedRole == -1 ? null : selectedRole,
                    validator: (value) {
                      if (value == null) {
                        return "Role is required";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      roleProvider.setRole(value!, roleList[value]);

                      log("Role==========> ${roleProvider.role}");
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFEFEFF1),

                      // normal border
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide.none,
                      ),

                      // error border
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: Colors.red, width: 1.5.w),
                      ),

                      // focused error border
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: Colors.red, width: 1.5),
                      ),
                    ),
                  );
                },
              ),

              UIHelper.verticalSpace(16.h),

              // Email Address
              Text(
                "Email Address",
                style: TextFontStyle.headLine16c141414InterW400,
              ),
              UIHelper.verticalSpace(4.h),
              CustomTextField(
                controller: _email,
                filled: true,
                validator: emailValidation,
              ),

              // Password
              UIHelper.verticalSpace(16.h),
              Text("Password", style: TextFontStyle.headLine16c141414InterW400),
              UIHelper.verticalSpace(4.h),

              Consumer<SignupProvider>(
                builder: (context, provider, child) {
                  return CustomTextField(
                    //  prefixIcon: Assets.icons.vector3,
                    obscureText: !provider.passwordVisible,
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: IconButton(
                      onPressed: provider.togglePasswordVisibility,
                      icon: SvgPicture.asset(
                        provider.passwordVisible
                            ? Assets.icons.eyeOff
                            : Assets.icons.eyeOn,
                        width: 20.w,
                        height: 20.h,
                        fit: BoxFit.none,
                        colorFilter: ColorFilter.mode(
                          Color(0xFFA1A1AA),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    textInputAction: TextInputAction.done,
                    controller: _password,
                    filled: true,
                    validator: passwordValidation,
                  );
                },
              ),

              UIHelper.verticalSpace(24.h),

              CustomButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // NavigationService.navigateToReplacement(
                    //   Routes.navigationScreen,
                    // );
                  }
                },
                text: "Sign up",
              ),

              UIHelper.verticalSpace(24.h),

              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextFontStyle.headLine16c141414InterW400,
                    children: [
                      TextSpan(text: "Already have an account? "),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            NavigationService.navigateToReplacement(
                              Routes.signinScreen,
                            );
                          },
                        text: "Login",
                        style: TextFontStyle.headLine16c141414InterW400
                            .copyWith(color: Colors.blue),
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
