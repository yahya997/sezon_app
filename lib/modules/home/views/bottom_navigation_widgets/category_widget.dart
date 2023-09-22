import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/core/widgets/custom_app_bar.dart';
import 'package:sezon_app/modules/home/controllers/home_controller.dart';
import '../../../../core/widgets/custom_text_widget.dart';
import 'package:sezon_app/core/utils/extensions/sized_box_extension.dart';

import '../../../../core/widgets/empty_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../product/widgets/product_widget.dart';
import '../widgets/build_category.dart';

class CategoryWidget extends GetView<HomeGetXController> {
  const CategoryWidget({super.key});
  // var controller= Get.find<HomeGetXController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: CustomAppBar(
        withLeading: false,
        title: 'category'.tr,
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: BuildCategory(
                              category: controller.categories[index],
                            ),
                          ),
                          controller.currentIndexInCategory == index
                              ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: Colors.red,
                            ),
                            height: 100,
                            width: 5,
                          )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                    onTap: () {
                      controller.changeIndexInCategory(index);
                      controller.getProductsByCategory(id: controller.categories[index].id);
                    },
                  );
                  // return Text('');
                },
                separatorBuilder: (context, index) {
                  return 30.ph();
                },
              )),
          Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.sp),
                child: controller.loading.value
                    ? const Center(
                  child: LoadingWidget(),
                )
                    : controller.productsByCategory.isNotEmpty
                    ? GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.productsByCategory.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 119.w / 143.sp,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h,
                  ),
                  itemBuilder: (context, index) {
                    return ProductWidget(
                      isHome: false,
                      product: controller.productsByCategory[index],
                      oldProduct: controller.productsByCategory[index],
                    );
                    // return Text('data');
                  },
                )
                    : EmptyWidget(),
              )),
        ],
      ),
    ),);
  }
}
