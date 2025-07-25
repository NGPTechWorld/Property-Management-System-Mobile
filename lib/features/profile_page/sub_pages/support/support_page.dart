import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/helper/app_functions.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/normal_app_bar.dart';

import 'support_controller.dart';

class SupportPage extends GetView<SupportController> {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NormalAppBar(title: 'الدعم والمساعدة'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16,
          vertical: AppPadding.p20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ContactSupportCard(),
            const SizedBox(height: AppSize.s24),

            Text(
              'الأسئلة الشائعة',
              style: Get.textTheme.headlineMedium!.copyWith(
                color: ColorManager.secColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppSize.s16),
            Obx(() {
              return Column(
                children:
                    controller.faqItems
                        .asMap()
                        .entries
                        .map(
                          (entry) => FAQItemTile(
                            index: entry.key,
                            faq: entry.value,
                            onToggle: () => controller.toggleFAQ(entry.key),
                          ),
                        )
                        .toList(),
              );
            }),
            const SizedBox(height: AppSize.s24),
            Text(
              'طرق أخرى للحصول على المساعدة',
              style: Get.textTheme.headlineMedium!.copyWith(
                color: ColorManager.secColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppSize.s16),
            HelpOptionTile(
              icon: Icons.email,
              title: 'البريد الإلكتروني',
              subtitle: 'support@propertyapp.com',
              color: ColorManager.orangeColor,
              onTap: () => AppFunctions.launchEmail('support@propertyapp.com'),
            ),
            HelpOptionTile(
              icon: Icons.chat,
              title: 'الدردشة الحية',
              subtitle: 'متاحة من 8 صباحاً إلى 10 مساءً',
              color: ColorManager.primaryDark,
              onTap: () => Get.toNamed(AppRoutes.chatPage),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactSupportCard extends StatelessWidget {
  const ContactSupportCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s16),
        color: ColorManager.primaryColor.withOpacity(0.1),
        border: Border.all(color: ColorManager.primaryColor),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppPadding.p12),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorManager.primaryColor,
            ),
            child: const Icon(Icons.headset_mic, color: Colors.white, size: 24),
          ),
          const SizedBox(width: AppSize.s16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'اتصل بفريق الدعم',
                  style: Get.textTheme.headlineSmall!.copyWith(
                    color: ColorManager.primaryDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppSize.s4),
                Text(
                  'متاح 24/7 لمساعدتك في أي استفسار',
                  style: Get.textTheme.bodyMedium!.copyWith(
                    color: ColorManager.grey3,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: ColorManager.primaryDark,
            ),
            onPressed: () {
              AppFunctions.callPhoneNumber('0988861119');
            },
          ),
        ],
      ),
    );
  }
}

class FAQItemTile extends StatelessWidget {
  final int index;
  final FAQItem faq;
  final VoidCallback onToggle;

  const FAQItemTile({
    super.key,
    required this.index,
    required this.faq,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSize.s12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s12),
        color: ColorManager.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
            vertical: AppPadding.p8,
          ),
          childrenPadding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
            vertical: AppPadding.p16,
          ),
          leading: Container(
            width: AppSize.s34,
            height: AppSize.s34,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorManager.primaryColor.withOpacity(0.1),
            ),
            child: Center(
              child: Text(
                '${index + 1}',
                style: Get.textTheme.bodyMedium!.copyWith(
                  color: ColorManager.primaryDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          title: Text(
            faq.question,
            style: Get.textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w600,
              color: ColorManager.primaryDark,
            ),
          ),
          trailing: Icon(
            faq.isExpanded
                ? Icons.keyboard_arrow_up
                : Icons.keyboard_arrow_down,
            color: ColorManager.primaryDark,
          ),
          onExpansionChanged: (expanded) => onToggle(),
          children: [
            Divider(color: ColorManager.grey3.withOpacity(0.3), height: 1),
            const SizedBox(height: AppSize.s12),
            Text(
              faq.answer,
              textAlign: TextAlign.right,
              style: Get.textTheme.bodyMedium!.copyWith(
                height: 1.6,
                color: ColorManager.grey3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HelpOptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback? onTap;

  const HelpOptionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSize.s12),
        padding: const EdgeInsets.all(AppPadding.p16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s12),
          color: ColorManager.white,
          border: Border.all(color: ColorManager.grey3.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(AppPadding.p12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.withOpacity(0.1),
              ),
              child: Icon(icon, color: color),
            ),
            const SizedBox(width: AppSize.s16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Get.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorManager.primaryDark,
                    ),
                  ),
                  const SizedBox(height: AppSize.s4),
                  Text(
                    subtitle,
                    style: Get.textTheme.bodyMedium!.copyWith(
                      color: ColorManager.grey3,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: ColorManager.grey3,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
