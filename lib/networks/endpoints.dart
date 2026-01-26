// ignore_for_file: constant_identifier_names, unnecessary_string_interpolations

// const String url = String.fromEnvironment("BASE_URL");
//const String url = "http://localhost:8080/api/v1";

const String url = "http://76.13.100.15:8080/api/v1";
// ignore: unnecessary_brace_in_string_interps
const String imageUrl = "${url}";

final class NetworkConstants {
  NetworkConstants._();
  static const ACCEPT = "Accept";
  static const APP_KEY = "App-Key";
  static const ACCEPT_LANGUAGE = "Accept-Language";
  static const ACCEPT_LANGUAGE_VALUE = "pt";
  static const APP_KEY_VALUE = String.fromEnvironment("APP_KEY_VALUE");
  static const ACCEPT_TYPE = "application/json";
  static const AUTHORIZATION = "Authorization";
  static const CONTENT_TYPE = "content-Type";
  static const MULTIPART_DATA = "multipart/form-data";
}

// final class PaymentGateway {
//   PaymentGateway._();
//   static String gateway(String orderId) =>  "https://demo.vivapayments.com/web/checkout?ref={$orderId}";
// }

final class Endpoints {
  Endpoints._();
  //backend_url
  //New
  static String signUp() => "/auth/register";
  static String signin() => "/auth/login";
  static String forgetPassword() => "/auth/forgot-password";
  static String otpVerify() => "/auth/forgot-password"; // endpoint change
  static String resetPassword() => "/auth/forgot-password"; // endpoint change

  // profile Update and Get
  static String getProfiles() => "/user/profile";
  static String updateProfiles() => "/user/profile";

  static String emailSupport() => "/email/support";

  // Create job from admin
  static String createJob() => "/job";

  // Create Report
  static String createReport() => "/report";

  // all user
  static String getAllUser({
    int? page,
    int? limit,
    String? search,
    int? role,
    bool? isSuspended,
    bool? isApproved,
  }) {
    final Map<String, String> queryParams = {};

    if (page != null) queryParams["page"] = page.toString();
    if (limit != null) queryParams["limit"] = limit.toString();
    if (search != null && search.trim().isNotEmpty) {
      queryParams["search"] = search;
    }
    if (role != null) queryParams["role"] = role.toString();
    if (isSuspended != null) {
      queryParams["isSuspended"] = isSuspended.toString();
    }
    if (isApproved != null) queryParams["isApproved"] = isApproved.toString();

    final uri = Uri.parse(
      "/user",
    ).replace(queryParameters: queryParams.isEmpty ? null : queryParams);

    return uri.toString();
  }

  // All Job

  static String getAllJob({
    int? page,
    int? limit,
    String? search,
    String? status,

    /// allowed values: this_month, previous_month, custom
    String? dateType,

    /// only required when dateType == custom
    String? customDate,
  }) {
    final Map<String, String> queryParams = {};

    if (page != null) queryParams["page"] = page.toString();
    if (limit != null) queryParams["limit"] = limit.toString();

    if (search != null && search.trim().isNotEmpty) {
      queryParams["search"] = search;
    }

    if (status != null && status.isNotEmpty) {
      queryParams["status"] = status;
    }

    if (dateType != null && dateType.isNotEmpty) {
      queryParams["dateType"] = dateType;

      //  only when custom
      if (dateType == "custom" && customDate != null && customDate.isNotEmpty) {
        queryParams["customDate"] = customDate;
      }
    }

    final uri = Uri.parse(
      "/job",
    ).replace(queryParameters: queryParams.isEmpty ? null : queryParams);

    return uri.toString();
  }

  // static String getAllJob({
  //   int? page,
  //   int? limit,
  //   String? search,
  //   String? status,
  //   String? custom,
  // }) {
  //   final Map<String, String> queryParams = {};

  //   if (page != null) queryParams["page"] = page.toString();
  //   if (limit != null) queryParams["limit"] = limit.toString();
  //   if (search != null && search.trim().isNotEmpty) {
  //     queryParams["search"] = search;
  //   }
  //   if (status != null) queryParams["status"] = status.toString();

  //   if (custom != null) queryParams["custom"] = custom.toString();

  //   final uri = Uri.parse(
  //     "/job",
  //   ).replace(queryParameters: queryParams.isEmpty ? null : queryParams);

  //   return uri.toString();
  // }

  // Image Label

  static String getLabel({int? page, int? limit, String? search}) {
    final Map<String, String> queryParams = {};

    if (page != null) queryParams["page"] = page.toString();
    if (limit != null) queryParams["limit"] = limit.toString();

    if (search != null && search.trim().isNotEmpty) {
      queryParams["search"] = search;
    }

    final uri = Uri.parse(
      "/image-label",
    ).replace(queryParameters: queryParams.isEmpty ? null : queryParams);

    return uri.toString();
  }

  static String logIn() => "/api/login";

  /// Job Details Summary
  static String getJob({required String id}) => "/job/$id";
  static String getReportJob({required String id}) => "/report/$id";

  // Create Label

  static String createLabel() => "/image-label";

  // update
  static String updateLabel({required String id}) => "/image-label/$id";
  // All Job
  static String getAllLabel({int? page, int? limit, String? search}) {
    final Map<String, String> queryParams = {};

    if (page != null) queryParams["page"] = page.toString();
    if (limit != null) queryParams["limit"] = limit.toString();
    if (search != null && search.trim().isNotEmpty) {
      queryParams["search"] = search;
    }

    final uri = Uri.parse(
      "/image-label",
    ).replace(queryParameters: queryParams.isEmpty ? null : queryParams);

    return uri.toString();
  }

  // Delete label
  static String deleteLabel({required String id}) => "/image-label/$id";

  // Suspend inspector User
  static String suspend({required String id}) => "/user/$id/suspend";
  // Unsuspend inspector user
  static String unSuspend({required String id}) => "/user/$id/unsuspend";

  // my job inspection
  static String getMyJob({int? page, int? limit, String? search}) {
    final Map<String, String> queryParams = {};

    if (page != null) queryParams["page"] = page.toString();
    if (limit != null) queryParams["limit"] = limit.toString();
    if (search != null && search.trim().isNotEmpty) {
      queryParams["search"] = search;
    }

    final uri = Uri.parse(
      "/job/my-jobs",
    ).replace(queryParameters: queryParams.isEmpty ? null : queryParams);

    return uri.toString();
  }

  // Test Images
  // Create Report
  static String singleImageP() => "/test/single-upload";

  // admin overview
  static String adminOverVIew() => "/admin/overview";
  static String inspectorOverVIew() => "/inspector/overview";
  //
  static String logout() => "/api/logout";
  static String getBabyProfile() => "/api/baby/profile/show";
  static String getProfile() => "/api/user/data";
  static String getCourseModules(String id) => "/api/course/module/$id";
  static String getCourseArticle(String id) => "/api/course/article/$id";
  static String getDailyReadArticle(String id) =>
      "/api/course/daily-read/article/$id";
  static String getAllCourses() => "/api/courses";
  static String getRecommendedCourses() => "/api/recommend/course";
  static String addBabyProfile() => "/api/baby/profile/store";
  static String updateBabyProfile(String id) => "/api/baby/profile/update/$id";
  static String updateProfile() => "/api/update-profile";
  static String getMyCloset() => "/api/user/clothing/show";
  static String addCloset() => "/api/user/clothing/store";
  static String forgotPassword() => "/api/forgot-password";
  static String setPassword() => "/api/reset-password";
  static String verifyOtp() => "/api/verify-otp";
  static String registrationOtpVerify() => "/api/verify/registration";
  static String getAvaiableItems(int temp) =>
      "/api/clothing/filter?temperature=$temp";
  static String getAdvices(String perams) => "/api/clothing/select?$perams";

  // course
  static String courseType() => "/api/course/types";
  static String survey(int id) => "/api/survay/questions/$id";
  static String postsurvey(int id) => "/api/survay/questions/answer/store/$id";
  static String surveyMark(int id) => "/api/survay/marks/$id";
  static String recomendedCourse() => "/api/recommend/course";

  //article
  static String getBookmark() => "/api/bookmarks";
  static String getSingleArticle(int id) => "/api/course/single-article/$id";
}
