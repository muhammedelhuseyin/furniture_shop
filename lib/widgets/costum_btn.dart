import 'package:flutter/material.dart';
import 'package:furniture_shop/corre/theme/app_colors.dart';
import 'package:furniture_shop/corre/theme/styles.dart';

class Costum_btm extends StatelessWidget {
  const Costum_btm({
    super.key,
    required this.hint,
    required this.onPressed, // ✅ إضافة البراميتر
  });

  final String hint;
  final VoidCallback onPressed; // ✅ نوع الدالة (بدون باراميترات ولا ترجع شيء)

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(370, 54),
        backgroundColor: AppColors.primary,
      ),
      onPressed: onPressed, // ✅ استدعاء الدالة عند الضغط
      child: Text(hint, style: Appstyles.medium16),
    );
  }
}
