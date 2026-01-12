import 'package:rxdart/subjects.dart';

import '../features/authentication/forget_password/data/rx.dart';
import '../features/authentication/otp_verified/data/rx.dart';
import '../features/authentication/reset_password/data/rx.dart';
import '../features/authentication/sign_in/data/rx.dart';
import '../features/authentication/sign_up/data/rx.dart';

// Authenticate
SignupRx signupRxObj = SignupRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
SigninRx signinRxObj = SigninRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
ForgetPasswordRx forgetPasswordRxObj = ForgetPasswordRx(
  empty: {},
  dataFetcher: BehaviorSubject<Map>(),
);
OtpVerifyRx otpVerifyRxObj = OtpVerifyRx(
  empty: {},
  dataFetcher: BehaviorSubject<Map>(),
);
ResetPasswordRx resetPasswordRxObj = ResetPasswordRx(
  empty: {},
  dataFetcher: BehaviorSubject<Map>(),
);
