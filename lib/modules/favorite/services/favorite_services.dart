import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:sezon_app/core/utils/storage/cach_helper.dart';
import 'package:sezon_app/modules/home/models/product_model.dart';

class FavoriteServices {
  final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;

  Future<bool> doesProductExist({required String userId ,required ProductModel product}) async {
    final productRef = _firebaseFireStore.collection('Favorites').doc('$userId-${product.id}');
    final doc = await productRef.get();
    return doc.exists;
  }

  Future<bool> saveProduct({required String userId ,required ProductModel product}) async {
    Map<String,dynamic> data = product.toJson();
    data.addAll({
      'user_id':userId
    });
    return await _firebaseFireStore
        .collection('Favorites')
        .doc('$userId-${product.id}')
        .set(data)
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }

  Future<bool> removeProduct({required String userId ,required ProductModel product}) async {
    return await _firebaseFireStore
        .collection('Favorites')
        .doc('$userId-${product.id}')
        .delete()
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }

  Future<QuerySnapshot<ProductModel>> getProducts(String userId) async {
    return await _firebaseFireStore.collection('Favorites').where('user_id',isEqualTo: userId).withConverter<ProductModel>(
      fromFirestore: (snapshot, _) => ProductModel.fromJson(snapshot.data()!),
      toFirestore: (product, _) => product.toJson(),
    ).get();
  }

}
