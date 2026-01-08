import 'package:artneidich_app/common_widget/header_widget.dart';
import 'package:artneidich_app/gen/assets.gen.dart';
import 'package:artneidich_app/provider/signin_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../common_widget/custom_button.dart';
import '../../constants/text_font_style.dart';
import '../../helpers/ui_helpers.dart';
import 'widgets/profile_widegt.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _nameController = TextEditingController();
  final _emailontroller = TextEditingController();
  final _phoneController = TextEditingController();
  final _changePasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailontroller.dispose();
    _phoneController.dispose();
    _changePasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(
              title: "Settings",
              icon: Assets.icons.profile.path,
              subtitle: "Profile",
            ),

            UIHelper.verticalSpace(20.h),

            ProfileWidget(
              name: _nameController,
              email: _emailontroller,
              phone: _phoneController,
              password: _changePasswordController,
              formkey: _formKey,
            ),

            UIHelper.verticalSpace(20.h),

            Consumer<SigninProvider>(
             
              builder: (context, provider, child) {
                return Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16.w),
                    child: CustomButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                
                          
                        }
                      },
                      borderRadius: 30.r,
                      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
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
                );
              }
            ),






             

            UIHelper.verticalSpaceExtraLarge,
          ],
        ),
      ),
    );
  }
}
