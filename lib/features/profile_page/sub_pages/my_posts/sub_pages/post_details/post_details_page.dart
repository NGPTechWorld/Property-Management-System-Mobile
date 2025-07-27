import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/normal_app_bar.dart';
import 'package:property_ms/features/profile_page/sub_pages/my_posts/my_posts_controller.dart';
import 'package:property_ms/features/profile_page/sub_pages/my_posts/my_posts_page.dart';
import './post_details_controller.dart';

class PostDetailsPage extends GetView<PostDetailsController> {
  const PostDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final post = Get.arguments as PostModel;

    return Scaffold(
      appBar: const NormalAppBar(title: 'تفاصيل المنشور'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostCard(post: post),
            const Divider(color: ColorManager.primary3Color),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
              child: Text(
                'العقارات المقترحة',
                style: Get.textTheme.headlineMedium!.copyWith(
                  color: ColorManager.secColor,
                ),
              ),
            ),
            const SizedBox(height: AppSize.s18),

            //! @Osama : here only one type could be recommended (rent or sell) (back problem ☺️☺️)
            // Expanded(
            //   child: SingleChildScrollView(
            //     child: Column(
            //       children: List.generate(
            //         controller.recommendedProperties.length,
            //         (index) => Padding(
            //           padding: const EdgeInsets.only(bottom: AppPadding.p12),
            //           child: _buildPropertyCard(
            //             controller.recommendedProperties[index],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
