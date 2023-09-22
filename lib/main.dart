import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/routes/app_pages.dart';
import 'core/utils/localizations/translation.dart';
import 'core/utils/localizations/translation_contoller.dart';
import 'core/utils/storage/cach_helper.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

 await Firebase.initializeApp(
     options: const FirebaseOptions(
          apiKey: 'AIzaSyDNOBw8Kh24aJlzoosJg3Y3PIzwvk7Grzo',
          appId: '1:765531335757:android:57bc1dba17c3118c3d4004',
          messagingSenderId: '765531335757',
          projectId: 'sezon-e22da'));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sezon App',
          localizationsDelegates:const [
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ar', 'SA'),
            Locale('en', 'US'),
          ],
          locale: TranslationController.initalLang,
          fallbackLocale: const Locale('ar'),
          translations: Translation(),
          theme: ThemeData(
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(color: Colors.black),
            ),
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'Tajawal'
          ),
            initialRoute: AppPages.initial,
            getPages: AppPages.routes,
        );
      },
    );
  }
}
