import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/modules/home/controllers/home_controller.dart';
import 'package:sezon_app/core/utils/extensions/sized_box_extension.dart';

import '../../models/category_model.dart';
import 'build_category.dart';

class ShowCategories extends StatelessWidget {
  ShowCategories({super.key, required this.categories});
  List<CategoryModel> categories = [];
  var controller = Get.find<HomeGetXController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              controller.changeIndex(1);
              controller.changeIndexInCategory(index);
              controller.getProductsByCategory(id: categories[index].id);
            },
            child: BuildCategory(category: categories[index]),
          );
        },
        separatorBuilder: (context, index) {
          return 18.pw();
        },
      ),
    );
  }
}
