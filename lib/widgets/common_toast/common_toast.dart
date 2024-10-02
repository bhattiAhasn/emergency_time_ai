import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../constants/app_colors/app_colors.dart';

class CommonToast {
  static void showToast(String message, {Color? color}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: color ?? AppColors.appColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
