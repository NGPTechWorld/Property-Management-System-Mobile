
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/normal_app_bar.dart';
import 'package:property_ms/features/profile_page/sub_pages/favorites_page/favorites_controller.dart';
import 'package:property_ms/features/widgets/empty_card.dart';
import 'package:property_ms/features/widgets/property_sale_card.dart';

class FavoritesPage extends GetView<FavoritesController> {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NormalAppBar(title: "المفضلة"),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: AppSize.s8),
            controller.favoritesListCrd.isEmpty
                ? const EmptyCard()
                : Container(),
            ...List.generate(controller.favoritesListCrd.length, (index) {
              final item = controller.favoritesListCrd[index];
if (item is PropertySaleCardModel) {
                return Column(
                  children: [
                    Center(child: PropertySaleCard(model: item)),
                    const SizedBox(height: AppSize.s8),
                  ],
                );
              } else {
                return const SizedBox();
              }
            }),
            const SizedBox(height: AppSize.s24),
          ],
        ),
      ),
    );
  }
}
