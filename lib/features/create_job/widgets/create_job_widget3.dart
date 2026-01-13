import 'package:artneidich_app/common_widget/custom_button.dart';
import 'package:artneidich_app/common_widget/custom_text_field.dart';
import 'package:artneidich_app/gen/assets.gen.dart';
import 'package:artneidich_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../constants/text_font_style.dart';

class CreateJobWidget3 extends StatefulWidget {
  const CreateJobWidget3({super.key});

  @override
  State<CreateJobWidget3> createState() => _CreateJobWidget3State();
}

class _CreateJobWidget3State extends State<CreateJobWidget3> {
  // Agreed controller

  final _dateController = TextEditingController();
  final _noteInspector = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _dateController.dispose();
    _noteInspector.dispose();
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
              Text("Date", style: TextFontStyle.headLine14c323539InterW400),
              UIHelper.verticalSpace(10.h),
              CustomTextField(
                readOnly: true,
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),

                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(
                            primary: Color(
                              0xFF2D8D7C,
                            ), // header background color (top bar)
                            onPrimary: Colors.white, // header text color
                            onSurface: Colors.black, // body text color
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              foregroundColor: Color(
                                0xFF2D8D7C,
                              ), // "CANCEL"/"OK" button color
                            ),
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );

                  if (pickedDate != null) {
                    setState(() {
                      _dateController.text = DateFormat(
                        'dd-MM-yyyy',
                      ).format(pickedDate);
                    });
                  }
                },
                suffixIcon: Icon(
                  Icons.date_range_outlined,
                  color: Color(0xFF2D8D7C),
                ),
                controller: _dateController,
                style: TextFontStyle.headLine14c323539InterW400.copyWith(
                  color: Color(0xFF71717A),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Date is required";
                  }
                  return null;
                },
              ),

              UIHelper.verticalSpace(12.h),

              //Inspector
              Text(
                "Note to Inspector",
                style: TextFontStyle.headLine14c323539InterW400,
              ),
              UIHelper.verticalSpace(10.h),
              CustomTextField(
                maxLines: 8,
                hintStyle: TextFontStyle.headLine14c323539InterW400,
                hintText: "Write your notes here....",
                controller: _noteInspector,
                style: TextFontStyle.headLine14c323539InterW400.copyWith(
                  color: Color(0xFF71717A),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Note inspector is required";
                  }
                  return null;
                },
              ),

              UIHelper.verticalSpace(10.h),

              Text(
                "Keep notes under. 250 characters.",
                style: TextFontStyle.headLine14c323539InterW400,
              ),

              UIHelper.verticalSpace(20.h),

              Align(
                alignment: Alignment.topRight,
                child: CustomButton(
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    //   createJobRxObj
                    //       .createJobRx(
                    //         inspector: inspector,
                    //         formType: formType,
                    //         feeStatus: feeStatus,
                    //         agreedFee: agreedFee,
                    //         fhaCaseDetailsNo: fhaCaseDetailsNo,
                    //         orderId: orderId,
                    //         streetAddress: streetAddress,
                    //         developmentName: developmentName,
                    //         siteContactName: siteContactName,
                    //         siteContactPhone: siteContactPhone,
                    //         siteContactEmail: siteContactEmail,
                    //         dueDate: dueDate,
                    //         specialNotesForInspector: specialNotesForInspector,
                    //       )
                    //       .waitingForFuture()
                    //       .then((success) {
                    //         if(success) {
                    //           ///
                    //               NavigationService.navigateToReplacement(
                    //             Routes.navigationScreen,
                    //           );
                    //         }
                    //       });

                    // }
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
                        "Assign",
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
