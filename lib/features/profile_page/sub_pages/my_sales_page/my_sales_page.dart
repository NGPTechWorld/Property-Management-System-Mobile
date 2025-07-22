import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:property_ms/core/Routes/app_routes.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/normal_app_bar.dart';
import 'package:property_ms/features/contract_details/contract_details_controller.dart';
import 'package:property_ms/features/profile_page/sub_pages/my_sales_page/my_sales_controller.dart';
import 'package:property_ms/features/profile_page/sub_pages/my_sales_page/widgets/sale_card.dart';

class MySalesPage extends GetView<MySalesController> {
  const MySalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NormalAppBar(title: "ممتلكاتي"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSize.s8),
          GestureDetector(
            onTap:
                () => Get.toNamed(
                  AppRoutes.contractDetailsRoute,
                  parameters: {"typeContract": ContractTypes.sale.name},
                ),
            child: SaleCard(
              model: SaleCardModel(
                title: "بيت 200م",
                location: "دمشق, ميدان",
                startDate: "2025-07-12",
                image: "",
                state: "تم البيع",
                price: "\$ 30k",
              ),
            ),
          ),
          SaleCard(
            model: SaleCardModel(
              title: "بيت 200م",
              location: "دمشق, ميدان",
              startDate: "2025-07-12",
              image: "",
              state: "تم إلغاء البيع",
              price: "\$ 30k",
            ),
          ),
          SaleCard(
            model: SaleCardModel(
              title: "بيت 200م",
              location: "دمشق, ميدان",
              startDate: "2025-07-12",
              image: "",
              state: "محجوز",
              price: "\$ 30k",
            ),
          ),
        ],
      ),
    );
  }
}
