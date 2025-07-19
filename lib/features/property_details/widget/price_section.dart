import 'package:flutter/material.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/app_button.dart';

class PriceSection extends StatelessWidget {
  final String price;
  final VoidCallback onPressed;

  const PriceSection({super.key, required this.price, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16,
          vertical: AppPadding.p16,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16,
          vertical: AppPadding.p16,
        ),
        decoration: BoxDecoration(
          color: ColorManager.cardBack3,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "السعر",
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: FontSize.s16,
                  ),
                ),
              ],
            ),
            const Spacer(),
            AppButton(
              text: 'احجز الآن',
              onPressed: onPressed,
              icon: const Icon(Icons.shopping_cart, color: Colors.white),
              backgroundColor: ColorManager.primaryDark,
              radius: AppSize.s20,
              iconOnLeft: true,
            ),
          ],
        ),
      ),
    );
  }
}
