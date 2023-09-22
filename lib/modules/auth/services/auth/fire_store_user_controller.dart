import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:sezon_app/core/utils/storage/cach_helper.dart';

class FirestoreUserController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<bool> saveUser({required User user}) async {
    return await _firebaseFirestore
        .collection('Users')
        .add({
          'id': user.uid,
          'name': user.displayName,
          'phone':user.phoneNumber,
          'email': user.email,
          'fcm_token': CacheHelper.getData(key: 'fcm_token'),
        })
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }


}
