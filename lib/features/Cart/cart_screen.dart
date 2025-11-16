import 'package:flutter/material.dart';
import 'package:furniture_shop/corre/helper/images.dart';
import 'package:furniture_shop/corre/theme/app_colors.dart';
import 'package:furniture_shop/corre/theme/styles.dart';
import 'package:furniture_shop/features/Cart/models/cart_models.dart';
import 'package:furniture_shop/features/Home/model/product_model.dart';
import 'package:furniture_shop/widgets/costum_arrow_back.dart';
import 'package:furniture_shop/widgets/costum_btn.dart';
import 'package:furniture_shop/widgets/quantity_selector.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // دالة لحساب السعر الإجمالي لمنتج واحد
  double _calculateProductTotal(CartModel product) {
    return product.price * product.quantity;
  }

  // دالة لحساب المجموع الكلي للمنتجات المحددة
  double _calculateCartTotal() {
    double total = 0;
    for (var product in CartModel.prodects) {
      if (product.chekbox) {
        total += _calculateProductTotal(product);
      }
    }
    return total;
  }

  // دالة لحساب عدد المنتجات المحددة
  int _getSelectedCount() {
    return CartModel.prodects.where((p) => p.chekbox).length;
  }

  // دالة لحذف المنتجات المحددة
  void _deleteSelectedProducts() {
    setState(() {
      CartModel.prodects.removeWhere((product) => product.chekbox);
    });

    // رسالة تأكيد
    if (CartModel.prodects.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('تم حذف جميع المنتجات'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg3,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.bg3,
        surfaceTintColor: AppColors.bg3,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CostumArrowBack(),
            GestureDetector(
              onTap: () {
                // تحقق إذا في منتجات محددة
                bool hasSelected = CartModel.prodects.any((p) => p.chekbox);
                if (hasSelected) {
                  // إظهار dialog للتأكيد
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('تأكيد الحذف'),
                      content: Text('هل تريد حذف المنتجات المحددة؟'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('إلغاء'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            _deleteSelectedProducts();
                          },
                          child: Text(
                            'حذف',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('يرجى تحديد منتج للحذف')),
                  );
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.delete_outlined),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 12.5, right: 12.5, bottom: 180),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(10),
                  SizedBox(
                    height:
                        MediaQuery.of(context).size.height -
                        400, // حدد ارتفاع معين
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: CartModel.prodects.length,
                      itemBuilder: (context, index) {
                        final product = CartModel.prodects[index];
                        return _buildCartItem(product);
                      },
                    ),
                  ),

                  Text("Recently View", style: Appstyles.semibold20),
                  Gap(12),
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Text(
                                              "NEW",
                                              style:
                                                  Appstyles.Regular10.copyWith(
                                                    color: Colors.white,
                                                  ),
                                            ),
                                          ),
                                          Container(
                                            width: 45,
                                            height: 17,
                                            decoration: BoxDecoration(
                                              color: const Color(0xffFFF0BA),
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                                    Text(
                                      product.name,
                                      style: Appstyles.medium16,
                                    ),
                                    Text(
                                      product.company,
                                      style: Appstyles.Regular12,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "₹ ${product.price}",
                                          style: Appstyles.medium16,
                                        ),
                                        Image.asset(
                                          Appimages.add_icon,
                                          scale: 4.5,
                                        ),
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
                  Gap(40),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(15),
              height: 200,

              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                spacing: 10,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total (items :${_getSelectedCount()})",
                        style: Appstyles.Regular14.copyWith(fontSize: 18),
                      ),
                      Text(
                        "\$${_calculateCartTotal().toStringAsFixed(2)}",
                        style: Appstyles.semibold20,
                      ),
                    ],
                  ),
                  Costum_btm(
                    hint: 'Proceed to checkout',
                    onPressed: () {
                      if (_getSelectedCount() > 0) {
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please select items first')),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // عنصر المنتج في السلة
  Widget _buildCartItem(CartModel product) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(8),
      width: 365,
      height: 107,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          Checkbox(
            activeColor: AppColors.secendry,
            value: product.chekbox,
            onChanged: (val) {
              setState(() {
                product.chekbox = val!;
              });
            },
          ),
         const Gap(12),
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              color: Color(0xffE3E3E3),
              borderRadius: BorderRadius.circular(12),
            ),
            child:  Image.asset(product.image, width: 66, height: 50),
          ),
        const  Gap(10),
          Expanded(
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const Gap(5),
                Text(
                  product.name,
                  style: Appstyles.medium16.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(product.company, style: Appstyles.Regular12),
                Row(
                  spacing: 18,
                  children: [
                    Text(
                      '\$${_calculateProductTotal(product).toStringAsFixed(2)}',
                      style: Appstyles.medium16.copyWith(
                        color: AppColors.secendry,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    QuantitySelector(
                      initialQuantity: product.quantity,
                      maxQuantity: 10,
                      onQuantityChanged: (newQuantity) {
                        setState(() {
                          product.quantity = newQuantity;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
