import 'package:flutter/material.dart';
import 'package:furniture_shop/corre/theme/app_colors.dart';
import 'package:furniture_shop/corre/theme/styles.dart';
import 'package:furniture_shop/features/Home/home_screen.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F8F8),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: 230,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Gap(35),
                  Text("My Profile", style: Appstyles.semibold22),
                  Gap(21),
                  AvatarImage(),
                  Gap(10),
                  Text("Muhammed El Hussein", style: Appstyles.semibold22),
                  Gap(7),
                  Text(
                    "muhammedelhuseyin@outlook.com",
                    style: Appstyles.Regular10.copyWith(
                      color: AppColors.namecolor,
                    ),
                  ),
                ],
              ),
            ),
        
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(30),
                      Text(
                        "Account",
                        style: Appstyles.medium16.copyWith(
                          color: Color(0xff828282),
                        ),
                      ),
                      const Gap(
                        18
                      ),
                      _buildSupportOption(context,
                        icon: Icons.settings_outlined,
                        title: 'Settings',
                        
                        color: AppColors.secendry,
                        onTap: () {},
                      ),
                      //Gap(13),
                      _buildSupportOption(context,
                        icon: Icons.notifications_none,
                        title: 'Notification',
                     
                        color: AppColors.icon2,
                        onTap: () {},
                      ),
                      //Gap(13),
                      _buildSupportOption(context,
                        icon: Icons.schedule,
                        title: 'Older History ',
                       
                        color: AppColors.icon3,
                        onTap: () {},
                      ),
                      Gap(30),
                       Text(
                        "Account",
                        style: Appstyles.medium16.copyWith(
                          color: Color(0xff828282),
                        ),
                      ),
                      const Gap(
                        18
                      ),
                      _buildSupportOption(context,
                        icon: Icons.lock_open_outlined,
                        title: 'Privacy & Policy',
                        
                        color: AppColors.icon4,
                        onTap: () {},
                      ),
                      //Gap(13),
                      _buildSupportOption(context,
                        icon: Icons.info_outline,
                        title: 'Terms & Conditions',
                     
                        color: AppColors.icon5,
                        onTap: () {},
                      ),
                      //Gap(13),
                      _buildSupportOption(context,
                        icon: Icons.logout_outlined,
                        title: 'Log Out ',
                       
                        color: AppColors.icon6,
                        onTap: () {},
                      ),
                      Gap(100),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportOption(
    BuildContext context, {
    required IconData icon,
    required String title,
   
    required Color color,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading:Container(
        height: 38,
        width: 38,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: color.withValues(alpha: 0.15)
        ),
        child: Icon(
          icon,color: color,
          )
          ) ,
      title: Text(title),
      trailing: Icon(Icons.chevron_right_rounded,color: color.withValues(alpha: 0.5),) ,
    );
  }
}

/*Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withOpacity(0.1), width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: color.withOpacity(0.5),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    ); */