import 'package:rxdart/subjects.dart';

import '../features/authentication/forget_password/data/rx.dart';
import '../features/authentication/otp_verified/data/rx.dart';
import '../features/authentication/reset_password/data/rx.dart';
import '../features/authentication/sign_in/data/rx.dart';
import '../features/authentication/sign_up/data/rx.dart';
import '../features/profile/data/rx_get_profile/model/profile_response_model.dart';
import '../features/profile/data/rx_get_profile/rx.dart';
import '../features/profile/data/rx_post_profile/rx.dart';

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

ProfileRx profileRxObj = ProfileRx(
  empty: ProfileResponse(),
  dataFetcher: BehaviorSubject<ProfileResponse>(),
);
UpdateProfileRx updateProfileRxObj = UpdateProfileRx(
  empty: {},
  dataFetcher: BehaviorSubject<Map>(),
);
