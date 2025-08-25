import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:property_ms/data/models/notification_model.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel model;
  final bool isLoaging;
  const NotificationCard({
    super.key,
    required this.model,
    this.isLoaging = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p12,
        vertical: AppPadding.p4,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color:
              model.isRead
                  ? ColorManager.yello.withAlpha(20)
                  : ColorManager.yello.withAlpha(50),
        ),
        child: Column(
          children: [
            const SizedBox(height: AppSize.s8),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p16,
                  ),
                  child: Icon(
                    model.isRead
                        ? Icons.notifications
                        : Icons.notifications_active,
                    color: ColorManager.yello,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      model.name,
                      style: Get.textTheme.bodyLarge!.copyWith(
                        color: ColorManager.primary6Color,
                        fontSize: FontSize.s14,
                      ),
                    ),
                  ),
                ),
                Text(
                  model.sentAt,
                  style: Get.textTheme.bodyLarge!.copyWith(
                    color: ColorManager.primary5Color,
                    fontSize: FontSize.s14,
                  ),
                ),
                const SizedBox(width: AppSize.s16),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p16,
                    ),
                    child: Text(
                      model.title,
                      style: Get.textTheme.bodyLarge!.copyWith(
                        color: ColorManager.primary6Color,
                        fontSize: FontSize.s12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p16,
                    ),
                    child: Text(
                      model.body,
                      style: Get.textTheme.bodyLarge!.copyWith(
                        color: ColorManager.primary6Color,
                        fontSize: FontSize.s12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSize.s8),
          ],
        ),
      ),
    );
  }
}
