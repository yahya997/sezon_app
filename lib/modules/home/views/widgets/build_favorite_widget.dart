import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sezon_app/modules/favorite/controllers/favorite_controller.dart';
import '../../../../core/widgets/custom_text_widget.dart';
import 'package:sezon_app/core/utils/extensions/sized_box_extension.dart';
import '../../models/product_model.dart';

class BuildFavoriteWidget extends StatelessWidget {
  const BuildFavoriteWidget({
    super.key,
    this.isFavorite = false,
    required this.product,
  });

  final bool isFavorite;
  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 80.h,
          width: 80.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(product!.images[0]),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.grey[200],
          ),
        ),
        15.pw(),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(text: product!.name, fontSize: 14.sp,fontWeight: FontWeight.w700,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: CustomTextWidget(
                  text: product!.details,
                  fontSize: 12.sp,
                  maxLines: 2,
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
              CustomTextWidget(
                text: '${product!.price}ر.س ',
                fontSize: 14.sp,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            final controller = Get.find<FavoriteGetXController>();
            controller.addProductToFavorites(
                product!, FirebaseAuth.instance.currentUser!.uid);
          },
          icon: SvgPicture.asset('assets/images/icons/delete_icon.svg'),
        ),
      ],
    );
  }
}
