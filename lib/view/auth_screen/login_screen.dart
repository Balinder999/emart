// ignore_for_file: camel_case_types

import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/view/home_screen/Home.dart';
import 'package:emart_app/view/auth_screen/signup_screen.dart';
import 'package:emart_app/widget_comman/app_logo_widget.dart';
import 'package:emart_app/widget_comman/bg_widget.dart';
import 'package:emart_app/widget_comman/custom_textfeild.dart';
import 'package:emart_app/widget_comman/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login_screen extends StatelessWidget {
  const Login_screen({Key? key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              applogoWidget(),
              10.heightBox,
              "Login in to $appname"
                  .text
                  .fontFamily(bold)
                  .white
                  .size(18)
                  .make(),
              15.heightBox,
              Column(
                children: [
                  customTextField(hint: emailHint, title: email),
                  customTextField(hint: passwordHint, title: password),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(forgetpass), // Corrected this line
                    ),
                  ),
                  5.heightBox,
                  ourButton(
                    color: redColor,
                    title: login,
                    textcolor: whiteColor,
                    onPress: () {
                      Get.to(() => Home());
                    },
                  ).box.width(context.screenWidth - 50).make(),
                  5.heightBox,
                  createNewAccount.text.color(fontGrey).make(),
                  5.heightBox,
                  ourButton(
                    color: goldenlight,
                    title: signup,
                    textcolor: redColor,
                    onPress: () {
                      Get.to(() => signup_screen());
                    },
                  ).box.width(context.screenWidth - 70).make(),
                  10.heightBox,
                  loginwith.text.color(fontGrey).make(),
                  5.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        3,
                        (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundColor: lightGrey,
                                radius: 25,
                                child: Image.asset(socialiconlist[index],
                                    width: 30),
                              ),
                            )),
                  )
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(const EdgeInsets.all(16))
                  .width(context.screenWidth - 70)
                  .shadowSm
                  .make(),
            ],
          ),
        ),
      ),
    );
  }
}
