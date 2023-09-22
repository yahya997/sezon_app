import 'package:get/get.dart';
import '../../modules/splash/views/splash_screen.dart';
import '../../modules/auth/bindings/auth_binding.dart';
import '../../modules/auth/views/login.dart';
import '../../modules/home/bindings/home_binding.dart';
import '../../modules/home/views/home_screen.dart';
import '../../modules/product/bindings/product_binding.dart';
import '../../modules/product/views/prodcut_details.dart';
part 'app_routes.dart';

class AppPages {

  static const String initial = Routes.initial;

  static final routes = [
    GetPage(
      name: Routes.initial,
      page: () => const SplashScreen(),
      binding: null,
    ),
    GetPage(
      name: Routes.auth,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.productDetails,
      page: () => ProductDetails(),
      binding: null,
    ),
    GetPage(
      name: Routes.productDetails,
      page: () => ProductDetails(),
      binding: ProductBinding(),
    ),
  ];
}
