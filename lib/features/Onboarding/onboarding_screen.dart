import 'package:flutter/material.dart';
import 'package:furniture_shop/corre/helper/images.dart';
import 'package:furniture_shop/corre/theme/styles.dart';
import 'package:furniture_shop/widgets/costum_btn.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(Appimages.onboarding_image),
              Gap(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enjoy Your Online \nShopping.",
                      style: Appstyles.semibold26
                    ),
                    Gap(10),
                    Text(
                      "Browser through all categories and shop the best furniture for your dream house",
                      style: Appstyles.Regular14
                    ),
                   Gap(14),
                    Costum_btm(hint: 'Get Started', onPressed: () { 
                      context.go('/home');
                     },),
                  ],
                ),
              ),
              Gap(17),
            ],
          ),
        ),
      ),
    );
  }
}
