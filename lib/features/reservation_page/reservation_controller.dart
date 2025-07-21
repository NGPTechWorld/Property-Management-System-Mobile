import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/features/reservation_page/widgets/rent_reservation.dart';
import 'package:property_ms/features/reservation_page/widgets/tourisem_reservation.dart';

class ReservationController extends GetxController {
  final pageIndex = 0.obs;
  ScrollController scrollController = ScrollController();
  PageController pageController = PageController();
  void selectTabScreen(int key) {
    pageIndex.value = key;
    pageController.jumpToPage(key);
  }

  final navButtons = {
    "الإيجارات العقارية": Assets.icons.property,
    "الإيجارات السياحية": Assets.icons.tourisem,
  };
  final pages = [const RentReservation(), const TourisemReservation()];
}
