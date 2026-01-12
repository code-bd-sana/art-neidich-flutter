import 'package:artneidich_app/common_widget/custom_text_field.dart';
import 'package:artneidich_app/constants/text_font_style.dart';
import 'package:artneidich_app/helpers/loading_helper.dart';
import 'package:artneidich_app/helpers/ui_helpers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../common_widget/auth_custom_app_bar.dart';
import '../../../common_widget/custom_button.dart';
import '../../../constants/validation.dart';
import '../../../gen/assets.gen.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/navigation_service.dart';
import '../../../networks/api_acess.dart';
import '../../../provider/signup_provider.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _email.dispose();
    _password.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthCustomAppBar(
        titleText: 'Sign In',
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

              // Forget password
              UIHelper.verticalSpace(16.h),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    NavigationService.navigateTo(Routes.forgetPasswordScreen);
                  },
                  child: Text(
                    "Forget Password?",
                    style: TextFontStyle.headLine16c141414InterW400,
                  ),
                ),
              ),

              UIHelper.verticalSpace(24.h),
              CustomButton( /// email: aa@gmail.com, password: raBBi@220£
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    signinRxObj
                        .signinRx(email: _email.text, password: _password.text)
                        .waitingForFuture()
                        .then((success) {
                          if (success) {
                            NavigationService.navigateToReplacement(
                              Routes.navigationScreen,
                            );
                          }
                        });
                  }
                },
                text: "Sign In",
              ),

              UIHelper.verticalSpace(24.h),

              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextFontStyle.headLine16c141414InterW400,
                    children: [
                      TextSpan(text: "Create an account? "),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            NavigationService.navigateToReplacement(
                              Routes.signUpScreen,
                            );
                          },
                        text: "Signup",
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
