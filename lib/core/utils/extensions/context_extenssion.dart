import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets/custom_text_widget.dart';

extension ContextExtenssion on BuildContext {
  void showSnackBar({required String message, bool error = false}) {
    Get.showSnackbar(
      GetSnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: error ? Colors.red.shade800 : Colors.green.shade800,
        dismissDirection: DismissDirection.horizontal,
        messageText: CustomTextWidget(
          text: message,
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        )
      )
    );
  }



}
