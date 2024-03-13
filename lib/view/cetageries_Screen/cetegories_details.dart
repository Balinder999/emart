import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controller/product_controller.dart';
import 'package:emart_app/view/cetageries_Screen/items_details.dart';
import 'package:emart_app/widget_comman/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CetegoriesDetails extends StatelessWidget {
  final String? title;
  const CetegoriesDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        title: title!.text.fontFamily(bold).white.make(),
      ),
      body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      controller.subcat.length,
                      (index) => "${controller.subcat[index]}"
                          .text
                          .size(12)
                          .color(darkFontGrey)
                          .fontFamily(semibold)
                          .makeCentered()
                          .box
                          .white
                          .rounded
                          .size(120, 60)
                          .margin(const EdgeInsets.symmetric(horizontal: 4))
                          .make()),
                ),
              ),
              20.heightBox,

              // item container

              Expanded(
                child: Container(
                    child: GridView.builder(
                        itemCount: 6,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          mainAxisExtent: 250,
                        ),
                        itemBuilder: (context, index) {
                          return Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(imgP5,
                                  width: 200, height: 150, fit: BoxFit.cover),
                              "Laptop 4GB/6GB"
                                  .text
                                  .fontFamily(semibold)
                                  .color(fontGrey)
                                  .make(),
                              10.heightBox,
                              "\$600"
                                  .text
                                  .color(redColor)
                                  .fontFamily(bold)
                                  .make()
                            ],
                          )
                                  .box
                                  .white
                                  .roundedSM
                                  .margin(
                                      const EdgeInsets.symmetric(horizontal: 4))
                                  .padding(const EdgeInsets.all(12))
                                  .make()
                                  .onTap(() {
                            Get.to(
                                () => const itemsdetails(title: "dummy items"));
                          }));
                        })),
              )
            ],
          )),
    ));
  }
}
