import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../storage/cach_helper.dart';


class TranslationController extends GetxController {
  static Locale initalLang = CacheHelper.getData(key: 'lang') == null
      ? const Locale('ar')
      : Locale(CacheHelper.getData(key: 'lang'));

  static void changeLang(String langCode) {
    CacheHelper.saveData(key: 'lang', value: langCode);
    Get.updateLocale(Locale(langCode));
  }
}