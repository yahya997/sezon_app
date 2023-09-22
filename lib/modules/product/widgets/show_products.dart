import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sezon_app/core/widgets/empty_widget.dart';
import 'package:sezon_app/modules/product/widgets/product_widget.dart';

import '../../home/models/product_model.dart';

class ShowProducts extends StatelessWidget {
  ShowProducts({
    super.key,
    required this.products,
  });
  List<ProductModel> products = [];

  @override
  Widget build(BuildContext context) {
    return products.isNotEmpty
        ? GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 162.w / 199.sp,
              crossAxisSpacing: 19.w,
              mainAxisSpacing: 19.h,
            ),
            itemBuilder: (context, index) {
              return ProductWidget(
                isHome: true,
                product: products[index],
                oldProduct: products[index],
              );
              // return Text('data');
            },
          )
        : const EmptyWidget();
  }
}
