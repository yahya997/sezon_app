import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sezon_app/modules/auth/services/auth/fb_auth_controller.dart';
import 'package:sezon_app/core/utils/extensions/context_extenssion.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sezon_app/core/utils/storage/cach_helper.dart';

import '../models/process_response.dart';

class AuthGetXController extends GetxController {

  final FbAuthController _authController = FbAuthController();
  RxBool loading = false.obs;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final key = GlobalKey<FormState>();

  User get user => _authController.user;
    Future<bool> signIn({required String email , required String password,required BuildContext context})async{
      loading.value=true;
    ProcessResponse processResponse= await _authController.signIn(email: email, password: password);

      if(processResponse.success){
        loading.value=false;
      }else{
      }
      loading.value=false;
    return processResponse.success;

    }
    Future<bool> createAccount ({
      required String email,
      required String phone,
      required String password,
      required BuildContext context
    }) async{
      loading.value=true;
      ProcessResponse processResponse= await _authController.createAccount(email: email, phone: phone, password: password);

      if(processResponse.success){
        loading.value=false;
      }else{
        context.showSnackBar(message: processResponse.message,error: true);
      }
      loading.value=false;
      return processResponse.success;
    }


    Future<bool> signOut() async{
      loading.value=true;
      bool signOut = await _authController.signOut();

      if(signOut){
        loading.value=false;
      }else{
        Get.snackbar("Error","Error occurred");
      }
      loading.value=false;
      return signOut;
    }

    Future<bool> forgetPassword({required String email,required BuildContext context}) async{
      loading.value=true;
      ProcessResponse processResponse= await _authController.forgetPassword(email: email);

      if(processResponse.success){
        loading.value=false;
      }else{
        context.showSnackBar(message: processResponse.message,error: true);
      }
      loading.value=false;
      return processResponse.success;
    }



}
