import 'package:flutter/material.dart';
import 'package:furniture_shop/corre/helper/images.dart';
import 'package:furniture_shop/corre/theme/styles.dart';
import 'package:furniture_shop/features/Favourite/model/favorite_model.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

int? _pressedIndex; // ✅ تتبع العنصر المضغوط

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: GridView.builder(
                padding: EdgeInsets.all(5),
                itemCount: FavoriteModel.favProduct.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16, // ✅ زيادة المسافة الأفقية (كانت 10)
                  mainAxisSpacing: 16, // ✅ إضافة المسافة العمودية
                  childAspectRatio: 0.60, // ✅ ضبط النسبة
                ),
                itemBuilder: (context, index) {
                  final product = FavoriteModel.favProduct[index];
                  return Container(
                    width: 175,
                    height: 302,
                    decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          // في الـ itemBuilder
                          child: AnimatedScale(
                            scale: _pressedIndex == index
                                ? 0.95
                                : 1.0, // ✅ قارن بالـ index
                            duration: Duration(milliseconds: 100),
                            child: GestureDetector(
                              onTapDown: (_) => setState(
                                () => _pressedIndex = index,
                              ), // ✅ حفظ الـ index
                              onTapUp: (_) => setState(
                                () => _pressedIndex = null,
                              ), // ✅ إزالة التتبع
                              onTapCancel: () =>
                                  setState(() => _pressedIndex = null),
                              onTap: () {
                                context.push(
                                  '/product-details',
                                  extra: {
                                    'title': product.title,
                                    'subtitle': product.subtitle,
                                    'image': product.image,
                                    'price': product.price,
                                    'rating': "2.5",
                                  },
                                );
                              },

                              child: Stack(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    margin: const EdgeInsets.all(8),
                                    height: 160,
                                    width: 177,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffE3E3E3),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        product.image,
                                        height: 143,
                                        width: 125,
                                      ),
                                    ),
                                  ),
                                  if (product.descount == true)
                                    Positioned(
                                      top: 5,
                                      left: 5,
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 3,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xffFF0404),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: Text(
                                          "${product.descounttotal} %",
                                          style: Appstyles.Regular12.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  Positioned(
                                    bottom: 16,
                                    left: 15,
                                    right: 15,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        // Container(
                                        //   alignment: Alignment.center,
                                        //   padding: EdgeInsets.symmetric(
                                        //     horizontal: 8,
                                        //     vertical: 3,
                                        //   ),
                                        //   decoration: BoxDecoration(
                                        //     color: const Color(0xffFF0404),
                                        //     borderRadius: BorderRadius.circular(
                                        //       10,
                                        //     ),
                                        //   ),
                                        //   child: Text(
                                        //     "NEW",
                                        //     style: Appstyles.Regular10.copyWith(
                                        //       color: Colors.white,
                                        //     ),
                                        //   ),
                                        // ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 6,
                                            vertical: 3,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xffFFF0BA),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Row(
                                            //  mainAxisAlignment:
                                            //MainAxisAlignment.spaceEvenly,
                                            mainAxisSize:
                                                MainAxisSize.min, // ✅ مهم

                                            children: [
                                              Image.asset(
                                                Appimages.star,
                                                scale: 3,
                                              ),
                                              Text(
                                                "2.5",
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
                            mainAxisSize: MainAxisSize.min, // ✅ مهم

                            children: [
                              Text(product.title, style: Appstyles.medium16),
                              Gap(2),
                              Text(
                                product.subtitle,
                                style: Appstyles.Regular12,
                              ),
                              Gap(2),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${product.price}  ل.س   ",
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
          ],
        ),
      ),
    );
  }
}
