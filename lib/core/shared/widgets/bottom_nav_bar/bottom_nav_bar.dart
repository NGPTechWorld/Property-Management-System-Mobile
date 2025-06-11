import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:property_ms/core/utils/constants/app_images.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChange;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final shortestSide = screenSize.shortestSide;

    final iconSize = (shortestSide * 0.06).clamp(16.0, 32.0);
    final fontSize = (shortestSide * 0.04).clamp(12.0, 20.0);
    final padding = EdgeInsets.symmetric(
      horizontal: (shortestSide * 0.02).clamp(8.0, 20.0),
      vertical: (shortestSide * 0.04).clamp(8.0, 20.0),
    );

    final outlineColor = Theme.of(context).colorScheme.outline;

    return Container(
      color: Theme.of(context).colorScheme.onPrimary,
      padding: EdgeInsets.symmetric(
        horizontal: shortestSide * 0.04,
        vertical: 12,
      ),
      child: GNav(
        selectedIndex: selectedIndex,
        onTabChange: onTabChange,
        color: outlineColor,
        activeColor: Colors.white,
        tabBackgroundColor: Theme.of(context).colorScheme.primary,
        tabBorderRadius: 10,
        duration: const Duration(milliseconds: 200),
        padding: padding,
        gap: 8,
        tabs: [
          _buildGButton(
            context,
            0,
            AppImages.home,
            'الرئيسية',
            iconSize,
            fontSize,
          ),
          _buildGButton(
            context,
            1,
            AppImages.managment,
            'إدارة',
            iconSize,
            fontSize,
          ),
          _buildGButton(
            context,
            2,
            AppImages.currentCourse,
            'الدورة الحالية',
            iconSize,
            fontSize,
          ),
          _buildGButton(
            context,
            3,
            AppImages.reports,
            'التقارير',
            iconSize,
            fontSize,
          ),
          _buildGButton(
            context,
            4,
            AppImages.profile,
            'الملف الشخصي',
            iconSize,
            fontSize,
          ),
        ],
      ),
    );
  }

  GButton _buildGButton(
    BuildContext context,
    int index,
    String iconPath,
    String label,
    double iconSize,
    double fontSize,
  ) {
    final isSelected = selectedIndex == index;
    final iconColor =
        isSelected ? Colors.white : Theme.of(context).colorScheme.outline;

    return GButton(
      icon: Icons.circle,
      leading: SvgPicture.asset(
        iconPath,
        width: iconSize,
        height: iconSize,
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
      ),
      text: label,
      textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
        fontSize: fontSize,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
