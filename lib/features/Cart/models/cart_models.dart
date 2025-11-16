import 'package:furniture_shop/corre/helper/images.dart';

class CartModel {
  final String image; // مسار الصورة أو رابطها
  final String name; // اسم المنتج
  final String company; // اسم الشركة
  final double price; // السعر
  bool chekbox; // التقييم (مثلاً من 5 نجوم)
  int quantity = 1;
  CartModel({
    required this.image,
    required this.name,
    required this.company,
    required this.price,
    required this.chekbox,
  });

  static List<CartModel> prodects = [
    CartModel(
      image: Appimages.image1,
      name: "Modern Chair",
      company: "Armchair",
      price: 12.500,
      chekbox: true,
    ),
    CartModel(
      image: Appimages.image2,
      name: "Minimalist Chair",
      company: "Armchair",
      price: 8.300,
      chekbox: true,
    ),
    CartModel(
      image: Appimages.image4,
      name: "Brown Chair",
      company: "Armchair",
      price: 7.000,
      chekbox: false,
    ),
  ];
}
