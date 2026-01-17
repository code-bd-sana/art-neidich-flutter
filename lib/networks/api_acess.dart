import 'package:rxdart/subjects.dart';

import '../features/authentication/forget_password/data/rx.dart';
import '../features/authentication/otp_verified/data/rx.dart';
import '../features/authentication/reset_password/data/rx.dart';
import '../features/authentication/sign_in/data/rx.dart';
import '../features/authentication/sign_up/data/rx.dart';
import '../features/create_job/data/rx_get_all_user/model/all_user_response.dart';
import '../features/create_job/data/rx_get_all_user/rx.dart';
import '../features/create_job/data/rx_post_create/rx.dart';
import '../features/create_label/data/rx_post/rx.dart';
import '../features/inspection/data/model/all_job_response.dart';
import '../features/inspection/data/rx_get/rx.dart';
import '../features/job_details/data/rx_get_report/model/job_report_response.dart';
import '../features/job_details/data/rx_get_report/rx.dart';
import '../features/job_details/data/rx_get_summary/model/summary_response.dart';
import '../features/job_details/data/rx_get_summary/rx.dart';
import '../features/labels/data/rx_delete/rx.dart';
import '../features/labels/data/rx_get/model/label_response.dart';
import '../features/labels/data/rx_get/rx.dart';
import '../features/labels/data/rx_update/rx.dart';
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
AllUserRx allUserRxObj = AllUserRx(
  empty: AllUserResponse(),
  dataFetcher: BehaviorSubject<AllUserResponse>(),
);
CreateJobRx createJobRxObj = CreateJobRx(
  empty: {},
  dataFetcher: BehaviorSubject<Map>(),
);
AllJobRx allJobRxObj = AllJobRx(
  empty: AllJobResponse(),
  dataFetcher: BehaviorSubject<AllJobResponse>(),
);

SummaryRx summaryRxObj = SummaryRx(
  empty: SummaryResponse(),
  dataFetcher: BehaviorSubject<SummaryResponse>(),
);

JobReportRx jobReportRxObj = JobReportRx(
  empty: ReportResponse(),
  dataFetcher: BehaviorSubject<ReportResponse>(),
);

CreateLabelRx createLabelRxObj = CreateLabelRx(
  empty: {},
  dataFetcher: BehaviorSubject<Map>(),
);

AllLabelRx allLabelRxObj = AllLabelRx(
  empty: GetLabelResponse(),
  dataFetcher: BehaviorSubject<GetLabelResponse>(),
);
DeleteLabelRx deleteLabelRxObj = DeleteLabelRx(
  empty: {},
  dataFetcher: BehaviorSubject<Map>(),
);

UpdateLabelRx updateLabelRxObj = UpdateLabelRx(
  empty: {},
  dataFetcher: BehaviorSubject<Map>(),
);
