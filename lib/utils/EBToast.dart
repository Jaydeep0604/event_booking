import 'package:event_booking/utils/app_colors.dart';
import 'package:flutter/material.dart';

class EbToast {
  static final EbToast instance = EbToast._internal();
  factory EbToast() {
    return instance;
  }
  EbToast._internal();
  showErrorMessage(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        "$msg",
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.whiteColor, fontSize: 12),
      ),
      backgroundColor: AppColors.sportColor,
      behavior: SnackBarBehavior.floating,
      elevation: 10,
      duration: Duration(milliseconds: 2000),
      dismissDirection: DismissDirection.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    ));
  }

  successMessage(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        "$msg",
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.whiteColor, fontSize: 12),
      ),
      backgroundColor: AppColors.primaryColor,
      behavior: SnackBarBehavior.floating,
      elevation: 10,
      duration: Duration(milliseconds: 2000),
      dismissDirection: DismissDirection.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
    ));
  }
  simpleMessage(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        "$msg",
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.primaryColor, fontSize: 12),
      ),
      backgroundColor: Colors.grey[300],
      behavior: SnackBarBehavior.floating,
      elevation: 10,
      duration: Duration(milliseconds: 1000),
      dismissDirection: DismissDirection.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
    ));
  }
}
