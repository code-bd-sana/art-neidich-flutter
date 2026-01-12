import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

final class ToastUtil {
  ToastUtil._();

  static void showShortToast(String message) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT);
  }

  static void showLongToast(String message) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_LONG);
  }

  static void showNoInternetToast() {
    Fluttertoast.showToast(
      msg: "Please check your internet connection".tr,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  static void showNotLoggedInToast() {
    Fluttertoast.showToast(
      msg: "Please login to perform this operation".tr,
      toastLength: Toast.LENGTH_SHORT,
    );
  }
}
