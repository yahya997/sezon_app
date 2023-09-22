import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/modules/home/models/category_model.dart';
import '../models/bottom_navigation_model.dart';
import '../models/product_model.dart';
import '../services/fb_home_controller.dart';
import '../views/bottom_navigation_widgets/category_widget.dart';
import '../views/bottom_navigation_widgets/favoriat_widget.dart';
import '../views/bottom_navigation_widgets/home_widget.dart';
import '../views/bottom_navigation_widgets/order_widget.dart';

class HomeGetXController extends GetxController {
  FBHomeController fbHomeController = FBHomeController();
  RxList<ProductModel> products = <ProductModel>[].obs;
  RxList<ProductModel> productsSearch = <ProductModel>[].obs;
  RxList<ProductModel> productsByCategory = <ProductModel>[].obs;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  RxBool loading = false.obs;
  RxBool loadingSearch = false.obs;
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() async {
    await getHomeData();
    await getProductsByCategory(id: categories[0].id);
    super.onInit();
  }

  static HomeGetXController get to => Get.find();
  var currentIndex = 0.obs;
  int currentIndexInCategory = 0;
  List<BottomNavigationModel> widgets = [
    BottomNavigationModel(title: 'home'.tr, widget: const HomeWidget()),
    BottomNavigationModel(title: 'category'.tr, widget: const CategoryWidget()),
    BottomNavigationModel(title: 'orders'.tr, widget: const OrderWidget()),
    BottomNavigationModel(title: 'favorite'.tr, widget: FavoriteWidget()),
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  void changeIndexInCategory(int index) {
    currentIndexInCategory = index;
    update();
  }

  Future<void> getHomeData() async {
    await getProducts();
    await getCategories();
  }

  Future<List<ProductModel>> getProducts() async {
    loading.value = true;
    var productsFormFirebase = await fbHomeController.getProducts();
    for (var element in productsFormFirebase.docs) {
      products.add(element.data());
    }
    loading.value = false;
    update();
    return products;
  }

  Future<List<ProductModel>> searchProduct() async {
    loadingSearch.value = true;
    productsSearch.value = [];
    searchController.text.isEmpty
        ? productsSearch.value = products
        : productsSearch.value = products
            .where((element) => element.name
                .toLowerCase()
                .contains(searchController.text.toLowerCase()))
            .toList();
    loadingSearch.value = false;
    return productsSearch;
  }

  Future<List<ProductModel>> getProductsByCategory(
      {required int id, int productId = 0}) async {
    loading.value = true;
    productsByCategory.value = [];

    var productsFormFirebase = await fbHomeController.getProductsByCategory(
        categoryId: id, productId: productId);
    print(productsFormFirebase.docs.length);
    for (var element in productsFormFirebase.docs) {
      productsByCategory.add(element.data());
    }
    loading.value = false;
    update();
    return productsByCategory;
  }

  Future<List<CategoryModel>> getCategories() async {
    loading.value = true;
    var categoriesFormFirebase = await fbHomeController.getCategories();
    for (var element in categoriesFormFirebase.docs) {
      categories.add(element.data());
    }
    loading.value = false;
    update();
    return categories;
  }
}
