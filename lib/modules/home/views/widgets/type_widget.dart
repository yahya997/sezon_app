import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_text_widget.dart';

import 'package:sezon_app/core/utils/extensions/sized_box_extension.dart';


class TypeWidget extends StatelessWidget {
  const TypeWidget({
    super.key,
    required this.type,
  });
  final String type;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20.h,
          width: 4.w,
          decoration: BoxDecoration(
            color:const Color(0xffD92728) ,
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        CustomTextWidget(text:type, fontSize: 18.sp,fontWeight: FontWeight.bold),
      ],
    );
  }
}
