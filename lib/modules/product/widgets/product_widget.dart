import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/core/widgets/cached_image_widget.dart';
import 'package:sezon_app/modules/home/controllers/home_controller.dart';
import 'package:sezon_app/core/routes/app_pages.dart';

import 'package:sezon_app/core/utils/extensions/sized_box_extension.dart';

import '../../../core/widgets/custom_text_widget.dart';
import '../../home/models/product_model.dart';

class ProductWidget extends StatelessWidget {
  ProductWidget({
    super.key,
    this.isHome = false,
    this.isDetails = false,
    required this.product,
    required this.oldProduct,
  });
  bool isHome;
  bool isDetails;
  ProductModel oldProduct;

  ProductModel product;
  var controller = Get.find<HomeGetXController>();

  @override
  Widget build(BuildContext context) {
    return isHome
        ? InkWell(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 0)
                  )
                ]
              ),
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CachedImageWidget(
                        url: product.images[0],
                        width: double.infinity,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    10.ph(),
                    CustomTextWidget(text: product.name, fontSize: 12.sp, fontWeight: FontWeight.bold),
                    8.ph(),
                    CustomTextWidget(
                      text: '${product.price} ر.س',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              Get.toNamed(Routes.productDetails, arguments: product.toJson());
            },
          )
        : isDetails
            ? GestureDetector(
                child: Container(
                  height: 143.h,
                  width: 119.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 5,
                            offset: const Offset(0, 0)
                        )
                      ]
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 83.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(product.images[0]),
                              fit: BoxFit.contain,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.grey[200],
                          ),
                        ),
                        CustomTextWidget(text: product.name, fontSize: 12.sp, fontWeight: FontWeight.bold),
                        CustomTextWidget(
                          text: '${product.price} ر.س',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Get.toNamed(Routes.productDetails, arguments: product.toJson());
                },
              )
            : InkWell(
                onTap: () {
                  Get.toNamed(Routes.productDetails, arguments: product.toJson());
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.white,
                      border: Border.all(
                        color: Colors.black.withOpacity(0.13),
                        width: 0.8
                      ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 8)
                      )
                    ]
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CachedImageWidget(
                            url: product.images.first,
                            width: double.infinity,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        CustomTextWidget(text: product.name, fontSize: 12.sp, fontWeight: FontWeight.bold),
                        CustomTextWidget(
                          text: '${product.price}  ر.س',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
              );
  }
}
