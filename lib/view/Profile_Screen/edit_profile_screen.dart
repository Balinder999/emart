import 'dart:io';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controller/profileController.dart'; // Import ProfileController
import 'package:emart_app/widget_comman/bg_widget.dart';
import 'package:emart_app/widget_comman/custom_textfeild.dart';
import 'package:emart_app/widget_comman/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;

  const EditProfileScreen({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize ProfileController and retrieve its instance
    var controller = Get.find<ProfileController>();

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Displaying profile image based on availability of data and controller path
                data['imageUrl'] == '' && controller.profileImgPath.isEmpty
                    ? Image.asset(
                        imgProfile2,
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    : data['imageUrl'] != '' &&
                            controller.profileImgPath.isEmpty
                        ? Image.network(
                            data['imageUrl'],
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make()
                        : Image.file(
                            File(controller.profileImgPath.value),
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make(),

                10.heightBox,

                // Button to change profile image
                ourButton(
                  color: redColor,
                  textcolor: whiteColor,
                  title: "Change",
                  onPress: () {
                    controller.changeImage(context);
                  },
                ),

                const Divider(),
                20.heightBox,

                // Text fields for name and password
                customTextField(
                  hint: namehint,
                  controller: controller.nameController,
                  title: name,
                  isPass: false,
                ),
                10.heightBox,
                customTextField(
                  hint: passwordHint,
                  controller: controller.oldpassController,
                  title: oldpass,
                  isPass: true,
                ),
                10.heightBox,
                customTextField(
                  hint: passwordHint,
                  controller: controller.newpassController,
                  title: newpass,
                  isPass: true,
                ),
                20.heightBox,

                // Button to save changes
                Center(
                  child: controller.isloading.value
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(redColor),
                        )
                      : SizedBox(
                          width: double.infinity,
                          child: ourButton(
                            color: redColor,
                            textcolor: whiteColor,
                            title: "Save",
                            onPress: () async {
                              controller.isloading(true);

                              //if image not selected
                              if (controller.profileImgPath.value.isNotEmpty) {
                                await controller.uploadProfileImage();
                              } else {
                                controller.profileImglink = data["imageUrl"];
                              }

                              // if old password matches data base

                              if (data['password'] ==
                                  controller.oldpassController.text) {
                                await controller.changeAuthPassword(
                                  email: data['email'],
                                  password: controller.oldpassController.text,
                                  newpassword:
                                      controller.newpassController.text,
                                );

                                await controller.updateprofile(
                                  name: controller.nameController.text,
                                  password: controller.newpassController.text,
                                  imgUrl: controller.profileImglink,
                                );
                                VxToast.show(context, msg: "Updated");
                              } else {
                                VxToast.show(context,
                                    msg: "Wrond old password");
                                controller.isloading(false);
                              }
                            },
                          ),
                        ),
                ),
              ],
            )
                .box
                .white
                .shadowSm
                .padding(const EdgeInsets.all(16))
                .margin(const EdgeInsets.only(
                  top: 50,
                  left: 12,
                  right: 12,
                ))
                .rounded
                .make(),
          ),
        ),
      ),
    );
  }
}
