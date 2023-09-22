import 'package:flutter/material.dart';
import 'package:sezon_app/modules/home/views/widgets/build_order_widget.dart';
import 'package:sezon_app/core/utils/extensions/sized_box_extension.dart';

class PendingOrders extends StatelessWidget {
  const PendingOrders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const BuildOrderWidget();
      },
      separatorBuilder: (context, index) {
        return 10.ph();
      },
    );
  }
}
