import 'package:emart_app/consts/colors.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/widget_comman/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class itemsdetails extends StatelessWidget {
  final String? title;
  const itemsdetails({super.key, required this.title});

  @override
  Widget build(ontext) {
    return Scaffold(
        appBar: AppBar(
          title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_outline,
                )),
          ],
        ),
        body: Column(
          
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // swiper section
                    VxSwiper.builder(
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        height: 350,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            imgFc5,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        }),

                    10.heightBox,
                    title!.text
                        .size(16)
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .make(),

                    //rating

                    VxRating(
                      onRatingUpdate: (value) => {},
                      normalColor: textfieldGrey,
                      selectionColor: golden,
                      count: 5,
                      size: 25,
                      stepInt: true,
                    ),

                    10.heightBox,

                    "\$30,000"
                        .text
                        .fontFamily(bold)
                        .color(redColor)
                        .size(18)
                        .make(),
                    10.heightBox,
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Seller".text.white.fontFamily(semibold).make(),
                            5.heightBox,
                            "In House Brands"
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .size(16)
                                .make(),
                          ],
                        )),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child:
                              Icon(Icons.message_rounded, color: darkFontGrey),
                        )
                      ],
                    )
                        .box
                        .height(60)
                        .padding(EdgeInsets.symmetric(horizontal: 16))
                        .color(textfieldGrey)
                        .make(),

                    // color section
                    20.heightBox,

                    Column(
                      children: [
                        Row(children: [
                          SizedBox(
                            width: 100,
                            child: "Color: ".text.color(textfieldGrey).make(),
                          ),
                          Row(
                            children: List.generate(
                                3,
                                (index) => VxBox()
                                    .size(40, 40)
                                    .roundedFull
                                    .color(Vx.randomPrimaryColor)
                                    .margin(EdgeInsets.symmetric(horizontal: 4))
                                    .make()),
                          )
                        ]).box.padding(EdgeInsets.all(8)).make(),
                      ],
                    ).box.white.shadowSm.make(),

                    // quantity section

                    Row(children: [
                      SizedBox(
                        width: 100,
                        child: "Quantity: ".text.color(textfieldGrey).make(),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.remove)),
                          "0"
                              .text
                              .size(16)
                              .color(darkFontGrey)
                              .fontFamily(bold)
                              .make(),
                          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                          10.widthBox,
                          "(0 available)".text.color(textfieldGrey).make(),
                        ],
                      ),
                    ]).box.padding(EdgeInsets.all(8)).make(),

                    // total section

                    Row(children: [
                      SizedBox(
                        width: 100,
                        child: "Total: ".text.color(textfieldGrey).make(),
                      ),
                      "\$0.00"
                          .text
                          .color(redColor)
                          .size(16)
                          .fontFamily(bold)
                          .make(),
                    ]).box.padding(EdgeInsets.all(8)).make(),
                    // description section
                    "Description"
                        .text
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .make(),
                    10.heightBox,
                    "This is Balider creation.."
                        .text
                        .color(darkFontGrey)
                        .make(),

                    //button section
                    10.heightBox,

                    ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(
                            itemdetailsbuttonlist.length,
                            (index) => ListTile(
                                title: "${itemdetailsbuttonlist[index]}"
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                                trailing: Icon(Icons.arrow_forward)))),
                    20.heightBox,

                    //product you may like section
                    poductsyoumaylike.text
                        .fontFamily(bold)
                        .color(darkFontGrey)
                        .make(),
                    10.heightBox,

                    // i copied this widget form home screen
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            6,
                            (index) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(imgP1,
                                        width: 150, fit: BoxFit.cover),
                                    10.heightBox,
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
                                    .margin(EdgeInsets.symmetric(horizontal: 4))
                                    .roundedSM
                                    .padding(EdgeInsets.all(8))
                                    .make()),
                      ),
                    )
                  ],

                  //here our details  ui is compleated
                ),
              ),
            )),
            SizedBox(
                width: double.infinity,
                height: 60,
                child: ourButton(
                  color: redColor,
                  onPress: () {},
                  textcolor: whiteColor,
                  title: "Add to Cart",
                ))
          ],
        ).box.color(whiteColor).make());
  }
}
