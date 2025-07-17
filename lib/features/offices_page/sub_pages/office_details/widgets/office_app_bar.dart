import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/core/utils/color_manager.dart';

class OfficeAppBar extends StatelessWidget implements PreferredSizeWidget {
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
              Get.toNamed(AppRoutes.reportOfficePage);
            } else if (value == 'الإعدادات') {
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: const Text('الإعدادات'),
                      content: const Text('قيد التطوير   🚀🚀'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('إغلاق'),
                        ),
                      ],
                    ),
              );
            }
          },
          itemBuilder:
              (context) => [
                const PopupMenuItem(
                  value: 'الإعدادات',
                  child: Row(
                    children: [
                      Icon(Icons.settings, color: Colors.black54),
                      SizedBox(width: 8),
                      Text('الإعدادات'),
                    ],
                  ),
                ),
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
