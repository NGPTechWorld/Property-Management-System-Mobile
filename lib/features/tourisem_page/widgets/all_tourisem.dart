import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/tourisem_page/tourisem_controller.dart';
import 'package:property_ms/features/widgets/tourisem_card_small.dart';

class AllTourisem extends GetView<TourisemController> {
  const AllTourisem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
          child: Text(
            "كل الأماكن السياحية",
            style: Get.textTheme.headlineMedium!.copyWith(
              color: ColorManager.secColor,
            ),
          ),
        ),
        const SizedBox(height: AppSize.s18),
        Column(
          children: List.generate(
            controller.allTourisems.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: AppPadding.p12),
              child: GestureDetector(
                onTap:
                    () => Get.toNamed(
                      AppRoutes.tourismDetailsPage,
                      arguments: controller.allTourisems[index],
                    ),
                child: TourisemCardSmall(model: controller.allTourisems[index]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
