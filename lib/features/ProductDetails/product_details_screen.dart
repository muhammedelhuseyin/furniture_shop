import 'package:flutter/material.dart';
import 'package:furniture_shop/corre/helper/images.dart';
import 'package:furniture_shop/corre/helper/list.dart';
import 'package:furniture_shop/corre/theme/app_colors.dart';
import 'package:furniture_shop/corre/theme/styles.dart';
import 'package:furniture_shop/widgets/costum_arrow_back.dart';
import 'package:furniture_shop/widgets/costum_btn.dart';
import 'package:gap/gap.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.price,
    required this.rating,
  });
  final String title;
  final String subtitle;
  final String image;
  final String price;
  final String rating;
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

int selectedcolor = 0;
int quantity = 1;

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    double totalprice =
        double.parse(widget.price.replaceAll(RegExp(r'[^0-9.]'), '')) *
        quantity;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.bg3,
        surfaceTintColor: AppColors.bg3,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CostumArrowBack(),
            Container(
              alignment: Alignment.center,
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Image.asset(Appimages.fav_icon, scale: 4),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                height: 320,

                color: AppColors.bg3,
              ),
              Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: Image.asset(widget.image, scale: 2.6),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 40,
                child: Image.asset(Appimages.circle_icon, scale: 5),
              ),
              Positioned(
                right: 158,
                left: 158,
                bottom: 50,
                child: Container(
                  alignment: Alignment.center,
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(Appimages.to_arro_icon, scale: 3),
                ),
              ),
              Positioned(
                right: 160,
                //    left: ,
                bottom: 20,
                child: Text("360°", style: Appstyles.medium16),
              ),
            ],
          ),
          Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.title, style: Appstyles.semibold20),
                    Container(
                      width: 45,
                      height: 17,
                      decoration: BoxDecoration(
                        color: const Color(0xffFFF0BA),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(Appimages.star, scale: 3),
                          Text(widget.rating, style: Appstyles.Regular10),
                        ],
                      ),
                    ),
                  ],
                ),
                Gap(10),
                Text(widget.subtitle, style: Appstyles.Regular14),
                Gap(10),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "The simple and elegant shape makes it very suitable for those for you who like those of you who wants a minimalist room, ",
                        style: Appstyles.Regular14.copyWith(
                          color: Colors.black45,
                        ),
                      ),
                      TextSpan(
                        text: "Read More",
                        style: Appstyles.medium16.copyWith(
                          color: AppColors.secendry,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(30),
                Row(
                  children: List.generate(AppList.detaiilsimage.length, (
                    index,
                  ) {
                    final img = AppList.detaiilsimage[index];
                    return Container(
                      margin: EdgeInsets.only(right: 8),
                      width: 53,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset(img),
                    );
                  }),
                ),
                Gap(25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  spacing: 20,
                  children: [
                    Text(
                      "Color",
                      style: Appstyles.medium16.copyWith(
                        color: AppColors.secendry,
                      ),
                    ),
                    Row(
                      children: List.generate(AppList.colors.length, (index) {
                        final colorr = AppList.colors[index];
                        final isSelected = selectedcolor == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedcolor = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: isSelected
                                  ? Border.all(color: Colors.teal, width: 2)
                                  : null,
                            ),
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: colorr,
                            ),
                          ),
                        );
                      }),
                    ),
                    Container(
                      width: 86,
                      height: 22,
                      decoration: BoxDecoration(
                        color: AppColors.bg3,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (quantity < 9) {
                                setState(() {
                                  quantity++;
                                });
                              }
                            },
                            child: Image.asset(Appimages.add2_icon, scale: 2.4),
                          ),
                          Text(quantity.toString(), style: Appstyles.medium16),
                          GestureDetector(
                            onTap: () {
                              if (quantity > 1) {
                                setState(() {
                                  quantity--;
                                });
                              }
                            },
                            child: Image.asset(Appimages.min_icon, scale: 2.4),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Gap(15),
                Costum_btm(
                  hint: "Add to card ${totalprice.toStringAsFixed(0)}  ",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
