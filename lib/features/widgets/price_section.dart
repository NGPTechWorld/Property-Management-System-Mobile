import 'package:flutter/material.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/app_button.dart';

class PriceSection extends StatelessWidget {
  final String price;
  final String? payrate;
  final VoidCallback onPressed;
  final bool isLoading;

  const PriceSection({
    super.key,
    required this.price,
    this.payrate,
    required this.onPressed,
    this.isLoading = false,
  });

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
                Row(
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorManager.primaryDark,
                        fontSize: FontSize.s20,
                      ),
                    ),
                    if (payrate != null && payrate!.isNotEmpty) ...[
                      const SizedBox(width: AppSize.s16),
                      Text(
                        payrate!,
                        style: TextStyle(
                          color: ColorManager.primaryDark,
                          fontSize: FontSize.s16,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
            const Spacer(),
            AppButton(
              text: 'احجز الآن',
              onPressed: onPressed,
              icon: Assets.icons.cartIcon.svg(color: ColorManager.white),
              backgroundColor: ColorManager.primaryDark,
              radius: AppSize.s20,
              iconOnLeft: true,
              loadingMode: isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
