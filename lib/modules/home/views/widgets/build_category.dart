import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sezon_app/modules/home/models/category_model.dart';
import 'package:sezon_app/core/utils/extensions/sized_box_extension.dart';

import '../../../../core/widgets/custom_text_widget.dart';

class BuildCategory extends StatelessWidget {
  BuildCategory({super.key, required this.category});

  CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 44.h,
          width: 44.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(category.image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.grey[200],
          ),
        ),
        10.ph(),
        CustomTextWidget(text: category.name, fontSize: 12.sp, fontWeight: FontWeight.bold),
      ],
    );
  }
}
