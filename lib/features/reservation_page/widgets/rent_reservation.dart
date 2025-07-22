import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/Routes/app_routes.dart';
import 'package:property_ms/features/contract_details/contract_details_controller.dart';
import 'package:property_ms/features/reservation_page/widgets/reservation_card.dart';

class RentReservation extends StatelessWidget {
  const RentReservation({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onTap:
                () => Get.toNamed(
                  AppRoutes.contractDetailsRoute,
                  parameters: {"typeContract": ContractTypes.rentProperty.name},
                ),
            child: ReservationCard(
              model: ReservationCardModel(
                title: "بيت 200م",
                location: "دمشق , ميدان",
                endDate: '2025-12-20',
                startDate: '2025-05-20',
                image: "image",
                state: "مؤجر",
                type: "إيجار",
              ),
            ),
          ),
          ReservationCard(
            model: ReservationCardModel(
              title: "مزرعة 500 م",
              location: "دمشق , ربوة",
              endDate: '2025-06-20',
              startDate: '2025-05-20',
              image: "image",
              state: "منتهي",
              type: "إيجار",
            ),
          ),
        ],
      ),
    );
  }
}
