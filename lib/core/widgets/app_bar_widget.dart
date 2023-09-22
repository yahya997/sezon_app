import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../modules/home/controllers/home_controller.dart';
import '../routes/app_pages.dart';
import '../utils/localizations/translation_contoller.dart';
import '../utils/storage/cach_helper.dart';
import 'custom_text_widget.dart';

AppBar appBarWidget({HomeGetXController? controller,required String title,bool isHome = false}) {
  return isHome?  AppBar(
    leading: IconButton(
      onPressed: () {},
      icon: CircleAvatar(
        radius: 20.r,
      ),
    ),
    actions: [
      PopupMenuButton(
        offset: const Offset(0, 50),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              child: ListTile(
                onTap: () {
                  controller!.changeIndex(4);
                  Get.back();
                },
                title: CustomTextWidget(text: 'notification'.tr, fontSize: 15.sp),
                trailing: const Icon(Icons.notifications),
              ),
            ),
            PopupMenuItem(
              child: ListTile(
                onTap: () {

                  CacheHelper.getData(key: 'lang') == 'ar'
                      ?  TranslationController.changeLang('en')
                      :  TranslationController.changeLang('ar');
                  Get.back();

                },
                title: CustomTextWidget(text: 'change_language'.tr, fontSize: 15.sp),
                trailing: const Icon(Icons.language),
              ),
            ),
            PopupMenuItem(
              child: ListTile(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Get.offAllNamed(Routes.auth);
                },
                title: CustomTextWidget(text: 'logout'.tr, fontSize: 15.sp),
                trailing: const Icon(Icons.logout),
              ),
            ),
          ];
        },
      ),
    ],
    title: CustomTextWidget(text: title, fontSize: 18.sp, fontWeight: FontWeight.bold),
  ) : AppBar(
    actions: [
      PopupMenuButton(
        offset: const Offset(0, 50),
        itemBuilder: (context) {
          return [

            PopupMenuItem(
              child: ListTile(
                onTap: () {

                  CacheHelper.getData(key: 'lang') == 'ar'
                      ?  TranslationController.changeLang('en')
                      :  TranslationController.changeLang('ar');
                  Get.back();

                },
                title: CustomTextWidget(text: 'change_language'.tr, fontSize: 15.sp),
                trailing: const Icon(Icons.language),
              ),
            ),

          ];
        },
      ),
    ],
    title: CustomTextWidget(text: title.tr, fontSize: 18.sp, fontWeight: FontWeight.bold),
  );
}
