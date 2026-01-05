import 'package:artneidich_app/provider/reset_password_provider.dart';
import 'package:provider/provider.dart';

import '../provider/otp_provider.dart';
import '../provider/signin_provider.dart';
import '../provider/signup_provider.dart';

var providers = [
  //New
  ChangeNotifierProvider<SignupProvider>(
    create: ((context) => SignupProvider()),
  ),
  ChangeNotifierProvider<SigninProvider>(
    create: ((context) => SigninProvider()),
  ),
  ChangeNotifierProvider<OtpProvider>(create: ((context) => OtpProvider())),
  ChangeNotifierProvider<ResetPasswordProvider>(
    create: ((context) => ResetPasswordProvider()),
  ),
];
