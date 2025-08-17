import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/office_details_controller.dart';

class OfficeAppBar extends GetView<OfficeDetailsController>
    implements PreferredSizeWidget {
  const OfficeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManager.lightPrimaryColor,
      actions: [
        PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert),
          elevation: 8,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          onSelected: (value) {
            if (value == 'إبلاغ') {
              Get.toNamed(
                AppRoutes.reportOfficePage,
                arguments: controller.officeModel!.id,
              );
            }
          },
          itemBuilder:
              (context) => [
                const PopupMenuItem(
                  value: 'إبلاغ',
                  child: Row(
                    children: [
                      Icon(Icons.info_outline, color: Colors.black54),
                      SizedBox(width: 8),
                      Text('إبلاغ'),
                    ],
                  ),
                ),
              ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
