import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/modules/favorite/controllers/favorite_controller.dart';
import 'package:sezon_app/modules/home/controllers/home_controller.dart';
import 'package:sezon_app/core/routes/app_pages.dart';
import 'package:sezon_app/core/utils/extensions/sized_box_extension.dart';
import '../../../core/widgets/custom_text_widget.dart';
import '../../../core/widgets/empty_widget.dart';
import '../../../core/widgets/loading_widget.dart';
import '../../home/models/product_model.dart';
import '../widgets/product_widget.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key});

  var controllerHome = Get.find<HomeGetXController>();

  @override
  Widget build(BuildContext context) {
    ProductModel product = ProductModel.fromJson(Get.arguments as Map<String, dynamic>);
    return Scaffold(
        appBar: AppBar(
          title: CustomTextWidget(
              text: product.name, fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        body: Obx(() {
          return controllerHome.loading.value
              ? const Center(
            child: LoadingWidget(),
          )
              : Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 236.h,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(
                        milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: [
                    for (var i = 0; i < product.images.length; i++)
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.w),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          image: DecorationImage(
                            image: NetworkImage(product.images[i]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  ],
                ),
                CustomTextWidget(
                  text: product.name,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
                CustomTextWidget(
                  text: product.price.toString(),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
                CustomTextWidget(
                  text: product.details,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
                Row(
                  children: [
                    Container(
                      height: 20.h,
                      width: 4.w,
                      decoration: BoxDecoration(
                        color: const Color(0xffD92728),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    10.pw(),
                    CustomTextWidget(text: 'Related Products',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                  ],
                ),
                SizedBox(
                  height: 150.h,
                  child: controllerHome.productsByCategory.isNotEmpty ? ListView
                      .separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: controllerHome.productsByCategory.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ProductWidget(
                        oldProduct: product,
                        isHome: false,
                        product: controllerHome.productsByCategory[index],
                        isDetails: true,
                      );
                      // return const Text('data');
                    },
                    separatorBuilder: (context, index) {
                      return 10.pw();
                    },
                  ) : Container(
                    alignment: Alignment.center,
                    height: 150.h,
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.warning,
                          color: Colors.red,
                          size: 50.r,
                        ),
                        10.ph(),
                        CustomTextWidget(text: 'No Products',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                        10.ph(),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Container(
                          height: 50.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Get.locale?.languageCode == 'en' ? Radius.circular(5.r) : Radius.zero,
                              topRight: Get.locale?.languageCode == 'en' ? Radius.zero : Radius.circular(5.r),
                              bottomLeft: Get.locale?.languageCode == 'en' ? Radius.circular(5.r) : Radius.zero,
                              bottomRight: Get.locale?.languageCode == 'en' ? Radius.zero : Radius.circular(5.r),
                            ),
                            color: const Color(0xffD92728),
                          ),
                          child: Center(
                            child: CustomTextWidget(
                              text: 'Buy Now'.tr,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onTap: () {
                          Get.toNamed(Routes.payment);
                        },
                      ),
                    ),
                    Expanded(
                        child: GetX<FavoriteGetXController>(
                          builder: (controllerFav) {
                            if(controllerFav.loading.value){

                            }
                            return InkWell(
                              child: Container(
                                height: 50.h,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xffD92728)),
                                  borderRadius: BorderRadius.only(
                                    topRight: Get.locale?.languageCode == 'en' ? Radius.circular(5.r) : Radius.zero,
                                    topLeft: Get.locale?.languageCode == 'en' ? Radius.zero : Radius.circular(5.r),
                                    bottomRight: Get.locale?.languageCode == 'en' ? Radius.circular(5.r) : Radius.zero,
                                    bottomLeft: Get.locale?.languageCode == 'en' ? Radius.zero : Radius.circular(5.r),
                                  ),
                                ),
                                child: Center(
                                  child: FutureBuilder(
                                      future: controllerFav.isProductFavorite(
                                          product,
                                          FirebaseAuth.instance.currentUser!
                                              .uid),
                                      builder: (context, snapshot) {
                                        return controllerFav.loading.value ? const LoadingWidget() : CustomTextWidget(
                                          text: snapshot.data == true
                                              ? 'remove to Favorite'.tr
                                              : 'Add to Favorite'.tr,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                        );
                                      }
                                  ),
                                ),
                              ),
                              onTap: () {
                                controllerFav.addProductToFavorites(product,
                                    FirebaseAuth.instance.currentUser!.uid);
                              },
                            );
                          },
                        )),
                  ],
                )
              ],
            ),
          );
        })
    );
  }
}
