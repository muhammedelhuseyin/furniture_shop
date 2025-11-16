import 'package:flutter/material.dart';
import 'package:furniture_shop/corre/helper/images.dart';
import 'package:furniture_shop/corre/theme/styles.dart';
// استبدل الـ imports حسب مشروعك

class QuantitySelector extends StatefulWidget {
  final int initialQuantity;
  final int maxQuantity;
  final ValueChanged<int>? onQuantityChanged;

  const QuantitySelector({
    Key? key,
    this.initialQuantity = 1,
    this.maxQuantity = 9,
    this.onQuantityChanged,
  }) : super(key: key);

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity;
  }

  void _increment() {
    if (quantity < widget.maxQuantity) {
      setState(() {
        quantity++;
      });
      widget.onQuantityChanged?.call(quantity);
    }
  }

  void _decrement() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
      widget.onQuantityChanged?.call(quantity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        GestureDetector(
          onTap: _increment,
          child: Image.asset(Appimages.add2_icon, scale: 3.5),
        ),
        Text(quantity.toString(), style: Appstyles.medium16),
        GestureDetector(
          onTap: _decrement,
          child: Image.asset(Appimages.min_icon, scale: 3.5),
        ),
      ],
    );
  }
}
