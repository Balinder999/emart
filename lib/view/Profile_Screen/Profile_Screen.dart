import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/view/Profile_Screen/Components/card_details.dart';
import 'package:emart_app/widget_comman/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Profile_Screen extends StatelessWidget {
  const Profile_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          //edit profile button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.edit,
                  color: whiteColor,
                )).onTap(() {}),
          ),
          //user details section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Image.asset(
                  imgProfile2,
                  width: 100,
                  fit: BoxFit.cover,
                ).box.roundedFull.clip(Clip.antiAlias).make(),
                10.heightBox,
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Dummy user".text.fontFamily(semibold).white.make(),
                    5.heightBox,
                    "balinder@email.com".text.white.make(),
                  ],
                )),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(
                      color: whiteColor,
                    )),
                    onPressed: () {},
                    child: logout.text.fontFamily(semibold).white.make()),
              ],
            ),
          ),
          20.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              detailsCard(
                  count: "00",
                  title: "In your card",
                  width: context.screenWidth / 3.4),
              detailsCard(
                  count: "32",
                  title: "In your Wishlist",
                  width: context.screenWidth / 3.4),
              detailsCard(
                  count: "675",
                  title: "your order ",
                  width: context.screenWidth / 3.4),
            ],
          ),
          40.heightBox,

          //Button section

          ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: ((context, int index) {
                    return ListTile(
                      leading: Image.asset(
                        profilebuttonIcons[index],
                        width: 22,
                      ),
                      title: profilebuttonlist[index]
                          .text
                          .fontFamily(semibold)
                          .make(),
                    );
                  }),
                  separatorBuilder: ((context, index) {
                    return const Divider(
                      color: lightGrey,
                    );
                  }),
                  itemCount: profilebuttonlist.length)
              .box
              .white
              .padding(EdgeInsets.symmetric(horizontal: 4))
              .margin(EdgeInsets.all(12))
              .rounded
              .shadowSm
              .make()
              .box
              .color(redColor)
              .make()
        ],
      )),
    ));
  }
}
