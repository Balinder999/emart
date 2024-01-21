import 'package:flutter/material.dart';
import 'package:emart_app/consts/consts.dart';

Widget ourButton({onPress, color, textcolor, String? title}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      shape: RoundedRectangleBorder(),
      padding: const EdgeInsets.all(12),
    ),
    onPressed: onPress,
    child: title!.text.color(textcolor).fontFamily(bold).make(),
  );
}
