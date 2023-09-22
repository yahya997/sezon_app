import 'package:get/get.dart';

import '../../favorite/controllers/favorite_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeGetXController>(
      () => HomeGetXController(),
    );
    Get.put<FavoriteGetXController>(FavoriteGetXController());
  }
}
