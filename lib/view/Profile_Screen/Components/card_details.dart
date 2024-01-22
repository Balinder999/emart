import 'package:emart_app/consts/consts.dart';
import 'package:flutter/material.dart';

Widget detailsCard({width, String? count, String? title}) {
  return Column(
    children: [
      "00".text.fontFamily(bold).color(darkFontGrey).size(16).make(),
      5.heightBox,
      "In your cart".text.color(darkFontGrey).make(),
    ],
  ).box.white.height(80).rounded.width(width).padding(EdgeInsets.all(4)).make();
}
