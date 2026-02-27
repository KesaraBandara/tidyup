import 'package:flutter/material.dart';
import 'package:tidyup/utils/colors.dart';
import 'package:tidyup/utils/text_styles.dart';

class AppHelpers {
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.kFabColor,
        content: Text(message,
        style: AppTextStyles.appButton,),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}