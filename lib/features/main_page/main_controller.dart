import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/features/exploration_page/exploration_page.dart';
import 'package:property_ms/features/home_page/home_page.dart';
import 'package:property_ms/features/offices_page/offices_page.dart';
import 'package:property_ms/features/profile_page/profile_page.dart';
import 'package:property_ms/features/reservation_page/reservation_page.dart';

class MainController extends GetxController {
  PageController pageController = PageController();
  final pages = [
    const HomePage(),
    const OfficesPage(),
    const ExplorationPage(),
    const ReservationPage(),
    const ProfilePage(),
  ];
  final pageIndex = 0.obs;

  void changePage(int newIndex) {
    pageIndex.value = newIndex;
    pageController.animateToPage(
      newIndex,
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }
}

class NavBarItem {
  final String name;
  final SvgGenImage? icon;

  NavBarItem(this.name, this.icon);
}
