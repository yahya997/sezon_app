import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';

BottomNavigationBar AppBottomNavigationBar({int currentIndex=0, Function(int index)? onTap, bool isHome=true}) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex:  currentIndex!=4 ?currentIndex : 0,
    onTap: onTap,
    selectedItemColor: currentIndex!=4 ?Colors.red : Colors.grey,
    unselectedItemColor: Colors.grey,
    showUnselectedLabels: true,
    items: isHome ? [
      BottomNavigationBarItem(
        icon: Icon(Icons.home,),
        label: 'home'.tr,

      ),
      BottomNavigationBarItem(
          icon:  Icon(Icons.category),
          label: 'category'.tr
      ),
      BottomNavigationBarItem(
          icon:  Icon(Icons.shopping_cart_rounded),
          label: 'orders'.tr
      ),
       BottomNavigationBarItem(
          icon:  Icon(Icons.favorite),
          label: 'favorite'.tr
      ),
    ] : [
      BottomNavigationBarItem(
        icon: Icon(Icons.home,),
        label: 'home'.tr,

      ),
      BottomNavigationBarItem(
          icon:  Icon(Icons.shopping_cart_rounded),
          label: 'orders'.tr
      ),
      BottomNavigationBarItem(
          icon:  Icon(Icons.notifications),
          label: 'notification'.tr
      ),
      BottomNavigationBarItem(
          icon:  Icon(Icons.person),
          label: 'profile'.tr
      ),
    ]
  );
}