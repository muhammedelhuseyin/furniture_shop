import 'package:flutter/material.dart';
import 'package:furniture_shop/corre/theme/app_colors.dart';
import 'package:furniture_shop/features/Favourite/favourite_screen.dart';
import 'package:furniture_shop/features/ProductDetails/product_details_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:furniture_shop/features/onboarding/onboarding_screen.dart';
import 'package:furniture_shop/features/home/home_screen.dart';
import 'package:furniture_shop/features/cart/cart_screen.dart';
import 'package:furniture_shop/features/profile/profile_screen.dart';

// إعداد GoRouter
final appRouter = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    // صفحة الـ Onboarding (بدون Bottom Navigation)
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),

    // ✅ صفحة تفاصيل المنتج (بدون BottomNavigationBar)
    GoRoute(
      path: '/product-details',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>; // تمرير البيانات
        return ProductDetails(
          title: extra['title'],
          subtitle: extra['subtitle'],
          image: extra['image'],
          price: extra['price'],
          rating: extra['rating'],
        );
      },
    ),

    // الصفحات الرئيسية مع Bottom Navigation
    ShellRoute(
      builder: (context, state, child) {
        return ScaffoldWithNavBar(child: child);
      },
      routes: [
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: HomeScreen()),
        ),
        GoRoute(
          path: '/cart',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: CartScreen()),
        ),
        GoRoute(
          path: '/favourite',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: FavouriteScreen()),
        ),
        GoRoute(
          path: '/profile',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ProfileScreen()),
        ),
      ],
    ),
  ],
);

// Scaffold مع Bottom Navigation Bar
class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;

  const ScaffoldWithNavBar({super.key, required this.child});

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    switch (location) {
      case '/home':
        return 0;
      case '/cart':
        return 1;
      case '/favourite':
        return 2;
      case '/profile':
        return 3;
      default:
        return 0;
    }
  }

  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/cart');
        break;
      case 2:
        context.go('/favourite');
        break;
      case 3:
        context.go('/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _getCurrentIndex(context);

    return Scaffold(
      extendBody: true, // ← أضف هذا
      body: Stack(
        children: [
          child,
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -2), // ← ظل من فوق
                  ),
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 2), // ← ظل من تحت
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(
                      context: context,
                      icon: Icons.home_rounded,
                      label: 'Home',
                      index: 0,
                      isSelected: currentIndex == 0,
                      onTap: () => _onTap(context, 0),
                    ),
                    _buildNavItem(
                      context: context,
                      icon: Icons.shopping_cart_rounded,
                      label: 'Cart',
                      index: 1,
                      isSelected: currentIndex == 1,
                      onTap: () => _onTap(context, 1),
                    ),
                    _buildNavItem(
                      context: context,
                      icon: Icons.favorite_rounded,
                      label: 'Favourite',
                      index: 2,
                      isSelected: currentIndex == 2,
                      onTap: () => _onTap(context, 2),
                    ),
                    _buildNavItem(
                      context: context,
                      icon: Icons.person_rounded,
                      label: 'Profile',
                      index: 3,
                      isSelected: currentIndex == 3,
                      onTap: () => _onTap(context, 3),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required int index,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final primaryColor = AppColors.primary;
    final unselectedColor = Colors.grey.shade600;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: isSelected
                      ? primaryColor.withValues(alpha: .15)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 24,
                  color: isSelected ? primaryColor : unselectedColor,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: isSelected ? primaryColor : unselectedColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
