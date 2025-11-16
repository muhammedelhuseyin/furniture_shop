import 'package:flutter/material.dart';
import 'package:furniture_shop/corre/helper/images.dart';

class CostumArrowBack extends StatelessWidget {
  const CostumArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 40,
      width: 40,
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: Image.asset(Appimages.back_icon, scale: 4),
    );
  }
}
