
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension sizedBoxExtension on num {
  Widget ph() => SizedBox(
        height: this.h,
      );
  Widget pw() => SizedBox(
        width: this.w,
      );
}


/*
 SizedBox(
                  height: 30.h,
                ),
 */