import 'package:emart_app/view/Profile_Screen/Profile_Screen.dart';
import 'package:emart_app/view/Splash_Screen.dart';
import 'package:emart_app/view/cetageries_Screen/Cetegories_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'consts/consts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(
              color: darkFontGrey,
            )),
        fontFamily: regular,
      ),
      home: const Splash_Screen(),
    );
  }
}
