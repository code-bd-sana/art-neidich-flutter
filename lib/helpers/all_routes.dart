import 'dart:io';

import 'package:artneidich_app/features/authentication/forget_password/forget_password_screen.dart';
import 'package:artneidich_app/features/authentication/otp_verified/otp_verified_screen.dart';
import 'package:artneidich_app/features/authentication/sign_up/sign_up_screen.dart';
import 'package:artneidich_app/navigation_screen.dart';
import 'package:flutter/cupertino.dart';

import '../features/admin/admin_screen.dart';
import '../features/approval_list/presentation/approval_list_screen.dart';
import '../features/authentication/reset_password/reset_password_screen.dart';
import '../features/authentication/sign_in/sign_in_screen.dart';
import '../features/create_job/presentation/create_job_screen.dart';
import '../features/create_label/create_label_screen.dart';
import '../features/inspector/inspector_screen.dart';
import '../features/inspector_list/presentation/inspector_list_screen.dart';
import '../features/inspector_role/camera_setting/camera_setting_screen.dart';
import '../features/inspector_role/email_support/email_support_screen.dart';
import '../features/inspector_role/help_support/presentation/help_support_screen.dart';
import '../features/inspector_role/inspect_notification/inspec_notification_screen.dart';
import '../features/inspector_role/inspection_case/inspection_case_screen.dart';
import '../features/inspector_role/inspection_id/inspection_id_screen.dart';
import '../features/inspector_role/inspection_progress/presentation/inspection_progress_screen.dart';
import '../features/inspector_role/inspection_summary/presentation/inspection_summary_screen.dart';
import '../features/job_details/presentation/job_details_screen.dart';
import '../features/profile/profile_screen.dart';
import '../features/security/security_screen.dart';
import '../features/settings/settings_screen.dart';

final class Routes {
  static final Routes _routes = Routes._internal();
  Routes._internal();
  static Routes get instance => _routes;

  static const String loadingScreen = '/Loading';
  static const String signUpScreen = '/signUpScreen';
  static const String signinScreen = '/signinScreen';
  static const String forgetPasswordScreen = '/forgetPasswordScreen';
  static const String otpVerifiedScreen = '/otpVerifiedScreen';
  static const String resetPasswordScreen = '/resetPasswordScreen';
  static const String jobDetailsScreen = '/jobDetailsScreen';

  static const String navigationScreen = '/navigationScreen';
  static const String createJobScreen = '/createJobScreen';
  static const String settingsScreen = '/settingsScreen';
  static const String profileScreen = '/profileScreen';
  static const String securityScreen = '/securityScreen';

  static const String adminScreen = '/adminScreen';
  static const String inspectorScreen = '/inspectorScreen';
  static const String inspectorListScreen = '/inspectorListScreen';
  static const String approvalListScreen = '/approvalListScreen';

  static const String createLabelScreen = '/createLabelScreen';

  static const String inspectionSummaryScreen = '/inspectionSummaryScreen';

  static const String inspectionIdScreen = '/inspectionIdScreen';

  static const String inspectionCaseScreen = '/inspectionCaseScreen';

  static const String inspectionProgressScreen = '/inspectionProgressScreen';

  static const String emailSupportScreen = '/emailSupportScreen';

  static const String cameraSettingScreen = '/cameraSettingScreen';

  static const String inspectNotificationScreen = '/inspectNotificationScreen';

  static const String helpSupportScreen = '/helpSupportScreen';
}

//
final class RouteGenerator {
  static final RouteGenerator _routeGenerator = RouteGenerator._internal();
  RouteGenerator._internal();
  static RouteGenerator get instance => _routeGenerator;

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.helpSupportScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: HelpSupportScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => HelpSupportScreen());

      case Routes.inspectNotificationScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: InspectNotificationScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => InspectNotificationScreen(),
              );

      case Routes.cameraSettingScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: CameraSettingScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => CameraSettingScreen());

      case Routes.emailSupportScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: EmailSupportScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => EmailSupportScreen());

      case Routes.inspectionProgressScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: InspectionProgressScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => InspectionProgressScreen(),
              );

      case Routes.inspectionCaseScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: InspectionCaseScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => InspectionCaseScreen());

      case Routes.inspectionSummaryScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: InspectionSummaryScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => InspectionSummaryScreen(),
              );

      case Routes.inspectionIdScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: InspectionIdScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => InspectionIdScreen());

      case Routes.createLabelScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: CreateLabelScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => CreateLabelScreen());

      case Routes.approvalListScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ApprovalListScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => ApprovalListScreen());
      case Routes.inspectorListScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: InspectorListScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => InspectorListScreen());

      case Routes.inspectorScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: InspectorScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => InspectorScreen());

      case Routes.adminScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: AdminScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => AdminScreen());

      case Routes.securityScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: SecurityScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => SecurityScreen());

      case Routes.profileScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: ProfileScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => ProfileScreen());
      case Routes.settingsScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: SettingsScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => SettingsScreen());

      case Routes.createJobScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: CreateJobScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => CreateJobScreen());
      case Routes.navigationScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: NavigationScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => NavigationScreen());

      case Routes.jobDetailsScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: JobDetailsScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => JobDetailsScreen());

      case Routes.resetPasswordScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ResetPasswordScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => ResetPasswordScreen());
      case Routes.otpVerifiedScreen:
        final args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: OtpVerifiedScreen(email: args["args"]),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => OtpVerifiedScreen(email: args["email"]),
              );
      case Routes.forgetPasswordScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ForgetPasswordScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => const ForgetPasswordScreen(),
              );
      case Routes.signUpScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const SignUpScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => const SignUpScreen());

      case Routes.signinScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const SigninScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => const SigninScreen());

      //     case Routes.loadingScreen:
      // return Platform.isAndroid
      //     ? _FadedTransitionRoute(widget: const Loading(), settings: settings)
      //     : CupertinoPageRoute(builder: (context) => const Loading());

      default:
        return null;
    }
  }
}

//  weenAnimationBuilder(
//   child: Widget,
//   tween: Tween<double>(begin: 0, end: 1),
//   duration: Duration(milliseconds: 1000),
//   curve: Curves.bounceIn,
//   builder: (BuildContext context, double _val, Widget child) {
//     return Opacity(
//       opacity: _val,
//       child: Padding(
//         padding: EdgeInsets.only(top: _val * 50),
//         child: child
//       ),
//     );
//   },
// );

class _FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  @override
  final RouteSettings settings;

  _FadedTransitionRoute({required this.widget, required this.settings})
    : super(
        settings: settings,
        reverseTransitionDuration: const Duration(milliseconds: 1),
        pageBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) {
              return widget;
            },
        transitionDuration: const Duration(milliseconds: 1),
        transitionsBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) {
              return FadeTransition(
                opacity: CurvedAnimation(parent: animation, curve: Curves.ease),
                child: child,
              );
            },
      );
}

class ScreenTitle extends StatelessWidget {
  final Widget widget;

  const ScreenTitle({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: .5, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceIn,
      builder: (context, value, child) {
        return Opacity(opacity: value, child: child);
      },
      child: widget,
    );
  }
}
