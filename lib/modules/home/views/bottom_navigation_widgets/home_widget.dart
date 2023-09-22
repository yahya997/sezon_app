import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sezon_app/core/widgets/custom_app_bar.dart';
import 'package:sezon_app/modules/auth/views/widgets/app_text_form_field.dart';
import 'package:sezon_app/modules/home/controllers/home_controller.dart';
import 'package:sezon_app/core/utils/extensions/sized_box_extension.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../widgets/type_widget.dart';
import '../widgets/show_categories.dart';
import '../../../product/widgets/show_products.dart';

class HomeWidget extends GetView<HomeGetXController> {
  const HomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        title: 'home'.tr,
        isHome: true
        //withLeading: false,
        //elevation: 4,
      ),
      body: Obx(() => controller.loading.value
          ? const Center(child: LoadingWidget())
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      height: 44.sp,
                      child: AppTextFormField(
                        textEditingController: controller.searchController,
                        hint: 'search'.tr,
                        fillColor: Colors.black.withOpacity(0.04),
                        prefixIcon: Container(
                          alignment: Alignment.center,
                            width: 30,
                            child: SvgPicture.asset('assets/images/icons/search-normal.svg')),
                        borderRadius: 10,
                        onChanged: (p0) async {
                          await controller.searchProduct();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 31.h,
                    ),
                    TypeWidget(
                      type: 'category'.tr,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ShowCategories(categories: controller.categories),
                    SizedBox(
                      height: 30.h,
                    ),
                    TypeWidget(
                      type: 'products'.tr,
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    controller.loadingSearch.value
                        ? const Center(
                            child: LoadingWidget(),
                          )
                        : ShowProducts(products: controller.searchController.text.isEmpty?controller.products:controller.productsSearch),

                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
            )),
    );
  }
}
