import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_text_widget.dart';
import 'package:sezon_app/core/utils/extensions/sized_box_extension.dart';

class BuildOrderWidget extends StatelessWidget {
  const BuildOrderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w,top: 16.h ,right: 16.w),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            height: 83.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset:
                  const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  height: 63.h,
                  width: 83.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.grey[200],
                  ),
                ),
                15.pw(),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                          text: 'خزف ملون صنع يدوي',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold),
                      5.ph(),
                      CustomTextWidget(
                          text: 'هذا النص هو مثال لنص يمكن أن يستبدل توليد هذا النص من مولد النص العربى...',
                          fontSize: 12.sp,
                        color: Colors.black.withOpacity(0.80),
                          ),

                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
