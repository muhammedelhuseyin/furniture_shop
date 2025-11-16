import 'package:furniture_shop/corre/helper/images.dart';

class FavoriteModel {
  final String title;
  final String subtitle;
  final String price;
  final String image;
   bool descount;
  final double descounttotal;

  FavoriteModel({required this.title, required this.subtitle, required this.price, required this.image, required this.descount, required this.descounttotal});


  static List<FavoriteModel> favProduct = [
    FavoriteModel(
      subtitle : "Armchair",
      price:"12.550",
      image:Appimages.image1,
      descount:true,
      descounttotal:20 ,
      title:"Minimalist Chair" ,
    ),
    FavoriteModel(
      subtitle : "Armchair",
      price:"8.500",
      image:Appimages.image2,
      descount:false,
      descounttotal:20,
      title:"Modern Chair" ,
    ),
  ];

}
