import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/modules/home/controllers/home_controller.dart';
import '../../../core/widgets/app_bar_widget.dart';
import '../../../core/widgets/app_bottom_navigation_bar.dart';

class HomeScreen extends GetView<HomeGetXController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          resizeToAvoidBottomInset: false,
          body: controller.widgets[controller.currentIndex.value].widget,
          bottomNavigationBar: AppBottomNavigationBar(
            onTap: (index) {
              controller.changeIndex(index);
            },
            currentIndex: controller.currentIndex.value,
          )),
    );
  }
}
