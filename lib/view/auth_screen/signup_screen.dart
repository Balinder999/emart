// ignore_for_file: use_build_context_synchronously

import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controller/auth_controller.dart';
import 'package:emart_app/view/home_screen/Home.dart';
import '../../widget_comman/app_logo_widget.dart' show applogoWidget;
import 'package:emart_app/widget_comman/bg_widget.dart';
import 'package:emart_app/widget_comman/custom_textfeild.dart';
import 'package:emart_app/widget_comman/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class signup_screen extends StatefulWidget {
  const signup_screen({super.key});

  @override
  State<signup_screen> createState() => _signup_screenState();
}

class _signup_screenState extends State<signup_screen> {
  bool? ischeck = false;
  var controller = Get.put(AuthController());

  //text controller
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordretypeController = TextEditingController();
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
              "Join The $appname".text.fontFamily(bold).white.size(18).make(),
              15.heightBox,
              Obx(
                () => Column(
                  children: [
                    customTextField(
                        hint: namehint,
                        title: name,
                        controller: nameController,
                        isPass: false),
                    customTextField(
                        hint: emailHint,
                        title: email,
                        controller: emailController,
                        isPass: false),
                    customTextField(
                        hint: passwordHint,
                        title: password,
                        controller: passwordController,
                        isPass: true),
                    customTextField(
                        hint: passwordHint,
                        title: retypepass,
                        controller: passwordretypeController,
                        isPass: true),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(forgetpass), // Corrected this line
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                            checkColor: redColor,
                            value: ischeck,
                            onChanged: (newvalue) {
                              setState(() {
                                ischeck = newvalue;
                              });
                            }),
                        10.widthBox,
                        Expanded(
                          child: RichText(
                              text: const TextSpan(children: [
                            TextSpan(
                                text: "I agree to the ",
                                style: TextStyle(
                                  fontFamily: regular,
                                  color: fontGrey,
                                )),
                            TextSpan(
                                text: termandcond,
                                style: TextStyle(
                                  fontFamily: regular,
                                  color: redColor,
                                )),
                            TextSpan(
                                text: " & ",
                                style: TextStyle(
                                  fontFamily: regular,
                                  color: fontGrey,
                                )),
                            TextSpan(
                                text: PrivacyPolicy,
                                style: TextStyle(
                                  fontFamily: regular,
                                  color: redColor,
                                )),
                          ])),
                        )
                      ],
                    ),
                    5.heightBox,
                    controller.isloading.value
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(redColor),
                          )
                        : ourButton(
                            color: ischeck == true ? redColor : lightGrey,
                            title: signup,
                            textcolor: whiteColor,
                            onPress: () async {
                              if (ischeck != false) {
                                controller.isloading(true);
                                try {
                                  await controller
                                      .signupMethod(
                                    context: context,
                                    email: emailController.text,
                                    password: passwordController.text,
                                  )
                                      .then((value) {
                                    return controller.storeUserData(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        name: nameController.text);
                                  }).then((value) {
                                    VxToast.show(context, msg: loggedin);
                                    Get.offAll(() => const Home());
                                  });
                                } catch (e) {
                                  auth.signOut();

                                  VxToast.show(context, msg: e.toString());
                                  controller.isloading(false);

                                  print('Error: $e');
                                }
                              }
                            },
                          ).box.width(context.screenWidth - 50).make(),
                    10.heightBox,
                    RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: alreadyhaveanaccount,
                          style: TextStyle(
                            fontFamily: bold,
                            color: fontGrey,
                          )),
                      TextSpan(
                          text: login,
                          style: TextStyle(
                            fontFamily: bold,
                            color: redColor,
                          ))
                    ])).onTap(() {
                      Get.back();
                    })
                  ],
                )
                    .box
                    .white
                    .rounded
                    .padding(const EdgeInsets.all(16))
                    .width(context.screenWidth - 70)
                    .shadowSm
                    .make(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
