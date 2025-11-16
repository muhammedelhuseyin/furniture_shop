import 'package:furniture_shop/corre/helper/images.dart';

class ProductModel {
  final String image; // مسار الصورة أو رابطها
  final String name; // اسم المنتج
  final String company; // اسم الشركة
  final String price; // السعر
  final double rating; // التقييم (مثلاً من 5 نجوم)

  ProductModel({
    required this.image,
    required this.name,
    required this.company,
    required this.price,
    required this.rating,
  });

  static List<ProductModel> prodects = [
    ProductModel(
      image: Appimages.image1,
      name: "Modern Chair",
      company:"Armchair" ,
      price:"12,500" ,
      rating:4.8 ,
    ),
    ProductModel(
      image: Appimages.image2,
      name: "Minimalist Chair",
      company:"Armchair" ,
      price:"8,300" ,
      rating:4.0 ,
    ),
  ];
  static List<ProductModel> bestseller = [
    ProductModel(
      image: Appimages.image3,
      name: "Yellow Chair",
      company:"Armchair" ,
      price:"10,500" ,
      rating:4.5 ,
    ),
    ProductModel(
      image: Appimages.image4,
      name: "Brown Chair",
      company:"Armchair" ,
      price:"9,300" ,
      rating:3.9 ,
    ),
  ];
}
