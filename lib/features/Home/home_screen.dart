import 'package:flutter/material.dart';
import 'package:furniture_shop/corre/helper/images.dart';
import 'package:furniture_shop/corre/helper/list.dart';
import 'package:furniture_shop/corre/theme/app_colors.dart';
import 'package:furniture_shop/corre/theme/styles.dart';
import 'package:furniture_shop/features/Home/model/product_model.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        backgroundColor: Color(0xffF8F8F8),
        surfaceTintColor: Color(0xffF8F8F8),
        toolbarHeight: 90,
        title: Text(
          "Discover The Best \nFurniture.",
          style: Appstyles.semibold20,
        ),
        actions: [AvatarImage(), Gap(20)],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 12.5, left: 12.5, bottom: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Image.asset(Appimages.search_icon, scale: 4),
                  suffixIcon: Image.asset(Appimages.filter_icon, scale: 4),
                  hint: Text(
                    "Search for furniture",
                    style: Appstyles.Regular14.copyWith(fontSize: 17),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                ),
              ),
              Gap(24),
              Text("Categories", style: Appstyles.semibold20),
              Gap(18),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 10,

                  children: List.generate(AppList.catagori.length, (index) {
                    return ChoiceChip(
                      label: Text(AppList.catagori[index]),
                      onSelected: (value) => setState(() {
                        selectedindex = index;
                      }),
                      selected: selectedindex == index,
                      selectedColor: AppColors.secendry,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70),
                      ),
                      showCheckmark: false,
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: selectedindex == index
                            ? Colors.white
                            : Colors.black,
                      ),
                    );
                  }),
                ),
              ),
              Gap(30),

              SizedBox(
                height: 302,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ProductModel.prodects.length,
                  itemBuilder: (context, index) {
                    final product = ProductModel.prodects[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      width: 175,
                      height: 302,
                      decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.push(
                                '/product-details',
                                extra: {
                                  'title': product.name,
                                  'subtitle': product.company,
                                  'image': product.image,
                                  'price': product.price,
                                  'rating': product.rating.toString(),
                                },
                              );
                            },

                            child: Stack(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(20),
                                  margin: const EdgeInsets.all(8),
                                  height: 183,
                                  width: 177,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffE3E3E3),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Image.asset(
                                    product.image,
                                    height: 143,
                                    width: 125,
                                  ),
                                ),
                                Positioned(
                                  bottom: 16,
                                  left: 15,
                                  right: 12,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        width: 40,
                                        height: 17,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffFF0404),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: Text(
                                          "NEW",
                                          style: Appstyles.Regular10.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 45,
                                        height: 17,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffFFF0BA),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Image.asset(
                                              Appimages.star,
                                              scale: 3,
                                            ),
                                            Text(
                                              product.rating.toString(),
                                              style: Appstyles.Regular10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 11,
                              right: 11,
                              top: 5,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(product.name, style: Appstyles.medium16),
                                Text(
                                  product.company,
                                  style: Appstyles.Regular12,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      " ${product.price} ل.س",
                                      style: Appstyles.medium16,
                                    ),
                                    Image.asset(Appimages.add_icon, scale: 4.5),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Gap(30),
              Text("Best Seller", style: Appstyles.semibold20),
              Gap(20),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ProductModel.bestseller.length,

                  itemBuilder: (context, index) {
                    final bseller = ProductModel.bestseller[index];
                    return Container(
                      margin: EdgeInsets.only(right: 15),
                      padding: EdgeInsets.all(10),
                      height: 107,
                      width: 262,
                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.push(
                                '/product-details',
                                extra: {
                                  'title': bseller.name,
                                  'subtitle': bseller.company,
                                  'image': bseller.image,
                                  'price': bseller.price,
                                  'rating': bseller.rating.toString(),
                                },
                              );
                            },
                            child: Stack(
                              children: [
                                Container(
                                  height: 90,
                                  width: 115,
                                  decoration: BoxDecoration(
                                    color: Color(0xffE3E3E3),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Image.asset(bseller.image, scale: 3.6),
                                ),
                                Positioned(
                                  right: 2,
                                  bottom: 0,
                                  child: Container(
                                    width: 45,
                                    height: 17,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffFFF0BA),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset(Appimages.star, scale: 3),
                                        Text(
                                          bseller.rating.toString(),
                                          style: Appstyles.Regular10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(bseller.name, style: Appstyles.medium16),
                              Text(bseller.company, style: Appstyles.Regular12),
                              Row(
                                spacing: 10,
                                children: [
                                  Text(
                                  " ${ bseller.price} ل.س ",
                                    style: Appstyles.medium16,
                                  ),
                                  Image.asset(Appimages.add_icon, scale: 5.8),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Gap(50),
            ],
          ),
        ),
      ),
    );
  }
}

class AvatarImage extends StatelessWidget {
  const AvatarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 21,
      backgroundImage: AssetImage(Appimages.person),
    );
  }
}
