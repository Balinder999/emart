import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controller/Home_controller.dart';
import 'package:emart_app/view/Profile_Screen/Profile_Screen.dart';
import 'package:emart_app/view/Cart_Screen/Cart_Screen.dart';
import 'package:emart_app/view/cetageries_Screen/Cetegories_Screen.dart';
import 'package:emart_app/view/home_screen/Home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    var navbaritems = [
      BottomNavigationBarItem(
          icon: Image.asset(icHome, width: 26), label: home),
      BottomNavigationBarItem(
          icon: Image.asset(icCategories, width: 26), label: cetegories),
      BottomNavigationBarItem(
          icon: Image.asset(icCart, width: 26), label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(icProfile, width: 26), label: account)
    ];

    var navBody = [
      Home_Screen(),
      Cetegories_Screen(),
      Cart_Screen(),
      Profile_Screen(),
    ];
    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(
              child: navBody.elementAt(controller.currentNavIndex.value))),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: redColor,
          selectedLabelStyle: TextStyle(
            fontFamily: semibold,
          ),
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          items: navbaritems,
          onTap: (value) {
            controller.currentNavIndex.value = value;
          },
        ),
      ),
    );
  }
}
