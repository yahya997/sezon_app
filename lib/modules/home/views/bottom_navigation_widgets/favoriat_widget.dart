import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/core/widgets/custom_app_bar.dart';
import 'package:sezon_app/modules/favorite/controllers/favorite_controller.dart';
import 'package:sezon_app/core/widgets/empty_widget.dart';


import '../../../../core/widgets/loading_widget.dart';
import '../../models/product_model.dart';
import '../widgets/build_favorite_widget.dart';

class FavoriteWidget extends StatelessWidget {
  FavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'favorite'.tr,
        withLeading: false,
      ),
      body: GetX<FavoriteGetXController>(
        initState: (state) {
          Get.find<FavoriteGetXController>().getProductsFavorite(FirebaseAuth.instance.currentUser!.uid);
        },
        builder:(controller) {
        List<ProductModel> product = controller.products;
          return controller.loading.value
              ? const Center(
                  child: LoadingWidget(),
                )
              : product.isNotEmpty
                  ? ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 20.h),
                    physics: const BouncingScrollPhysics(),
                    itemCount: product.length,
                    itemBuilder: (context, index) {
                      return BuildFavoriteWidget(
                        isFavorite: true,
                        product: product[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 20.h,
                        color: Colors.grey[300],
                        endIndent: 20.w,
                        indent: 20.w,
                      );
                    },
                  )
                  : const EmptyWidget();
        },
        // builder: (controller) =>
      ),
    );
  }
}
