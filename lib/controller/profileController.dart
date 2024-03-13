import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController {
  var profileImgPath = ''.obs;
  var profileImglink = '';
  var isloading = false.obs;

  // Text fields controllers
  var nameController = TextEditingController();
  var newpassController = TextEditingController();
  var oldpassController = TextEditingController();

  // Method to change profile image
  changeImage(BuildContext context) async {
    try {
      final img = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
      );
      if (img == null) return;
      profileImgPath.value = img.path;
    } on PlatformException catch (e) {
      // Display an error toast message if image selection fails
      VxToast.show(context, msg: "Error selecting image: $e");
    }
  }

  // Method to upload profile image to Firebase Storage
  uploadProfileImage() async {
    var filename = basename(profileImgPath.value);
    var destination = 'images/${currentUser!.uid}/$filename';
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profileImgPath.value));
    profileImglink = await ref.getDownloadURL();
  }

  // Method to update profile information in Firestore
  updateprofile({
    required String name,
    required String password,
    required String imgUrl,
  }) async {
    var store = FirebaseFirestore.instance
        .collection(usersCollection)
        .doc(currentUser!.uid);
    await store.set({
      'name': name,
      'password': password,
      'imageUrl': imgUrl,
    }, SetOptions(merge: true));
    isloading(false);
  }

  changeAuthPassword({email, password, newpassword}) async {
    final cred = EmailAuthProvider.credential(email: email, password: password);
    await currentUser!.reauthenticateWithCredential(cred).then((value) {
      currentUser!.updatePassword(newpassword);
    }).catchError((error) {
      print(error.toString());
    });
  }
}
