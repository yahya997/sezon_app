import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sezon_app/modules/favorite/services/favorite_services.dart';


import '../../home/models/product_model.dart';

class FavoriteGetXController extends GetxController {
  //TODO: Implement FavoriteController

  RxBool loading = false.obs;

  RxList<ProductModel> products = <ProductModel>[].obs;

  static FavoriteGetXController get to => FavoriteGetXController();


  void getProductsFavorite(String userId) async {
    products.clear();
    loading.value = true;
    var productsFormFirebase = await FavoriteServices().getProducts(userId);
    for (var element in productsFormFirebase.docs) {
      products.add(element.data());
    }
    loading.value = false;
  }


  void addProductToFavorites(ProductModel product, String userId) async{
    loading.value = true;
    bool productExist = await FavoriteServices().doesProductExist(userId: userId, product: product);
    if(productExist){
      await FavoriteServices().removeProduct(userId: userId,product: product);
    }else {
      await FavoriteServices().saveProduct(userId: userId,product: product);
    }
    isProductFavorite(product, userId);
    loading.value = false;
  }


  Future<bool> isProductFavorite(ProductModel product, String userId) async{
    return await FavoriteServices().doesProductExist(userId: userId, product: product);
  }

}
