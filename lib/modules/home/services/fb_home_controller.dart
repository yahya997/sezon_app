import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

class FBHomeController{
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  static FBHomeController instance = FBHomeController._();
  FBHomeController._();
  factory FBHomeController() {
    return instance;
  }

  Future<QuerySnapshot<ProductModel>> getProducts() async {
    return await _firebaseFirestore.collection('products').withConverter<ProductModel>(
      fromFirestore: (snapshot, _) => ProductModel.fromJson(snapshot.data()!),
      toFirestore: (product, _) => product.toJson(),
    ).get();
  }

 
  Future<bool> addProduct(ProductModel product) async {
    try {
      await _firebaseFirestore.collection('products').add(product.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }


  Future<QuerySnapshot<ProductModel>> getProductsByCategory({required int categoryId,int productId=0}) async {

    if(productId==0){
      return await _firebaseFirestore.collection(
          'products').where('category_id',isEqualTo: categoryId,).withConverter<ProductModel>(
        fromFirestore: (snapshot, _) => ProductModel.fromJson(snapshot.data()!),
        toFirestore: (product, _) => product.toJson(),
      ).get();
    }else{
      return await _firebaseFirestore.collection(
          'products').where('category_id',isEqualTo: categoryId,).where(
        'id',isNotEqualTo: productId,
      ).withConverter<ProductModel>(
        fromFirestore: (snapshot, _) => ProductModel.fromJson(snapshot.data()!),
        toFirestore: (product, _) => product.toJson(),
      ).get();
    }

  }


  Future<QuerySnapshot<CategoryModel>> getCategories() async {
    return await _firebaseFirestore.collection(
        'categories').withConverter<CategoryModel>(
      fromFirestore: (snapshot, _) => CategoryModel.fromJson(snapshot.data()!),
      toFirestore: (category, _) => category.toJson(),
    ).get();
  }


  Stream<QuerySnapshot> getOrders() async* {
    yield*  _firebaseFirestore.collection('orders').snapshots();
  }


  Stream<QuerySnapshot> getFavorites() async* {
    yield*  _firebaseFirestore.collection('favorites').snapshots();
  }

  Stream<QuerySnapshot> getCart() async* {
    yield*  _firebaseFirestore.collection('cart').snapshots();
  }

  Stream<QuerySnapshot> getAddresses() async* {
    yield*  _firebaseFirestore.collection('addresses').snapshots();
  }



}