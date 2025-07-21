import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/offices_page/widgets/office_card_style2.dart';
import 'package:property_ms/features/property_page/sub_pages/property_details/property_details_controller.dart';
import 'package:property_ms/features/property_page/sub_pages/property_details/widget/property_details_widget.dart';
import 'package:property_ms/features/property_page/sub_pages/property_details/widget/property_header.dart';
import 'package:property_ms/features/property_page/sub_pages/property_details/widget/related_properties_widgets.dart';
import 'package:property_ms/features/property_page/sub_pages/property_details/widget/room_details_widget.dart';
import 'package:property_ms/features/widgets/price_section.dart';
import 'package:property_ms/features/widgets/property_reusable_widget/image_carousel.dart';
import 'package:shimmer/shimmer.dart';

class PropertyDetailsPage extends GetView<PropertyDetailsController> {
  const PropertyDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const double appBarHeight = AppSize.s100 * 2.5;

    return Scaffold(
      body: SafeArea(
        top: false,
        child: NestedScrollView(
          controller: controller.scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: appBarHeight,
                toolbarHeight: kToolbarHeight + AppSize.s10,
                elevation: 0,
                leading: IconButton(
                  icon: Container(
                    height: AppSize.s40,
                    width: AppSize.s40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorManager.primaryColor,
                    ),
                    alignment: Alignment.center,
                    child: const Icon(Icons.chevron_left, color: Colors.white),
                  ),
                  onPressed: () => Get.back(),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  titlePadding: EdgeInsets.zero,
                  expandedTitleScale: 1.1,
                  background: Obx(() {
                    return controller.isLoadingImages.value
                        ? Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: appBarHeight,
                            width: double.infinity,
                            color: Colors.white,
                          ),
                        )
                        : ImageCarousel(
                          images:
                              controller.propertyDetails.images
                                  .map<ImageProvider<Object>>(
                                    (asset) => asset.provider(),
                                  )
                                  .toList(),
                          currentIndex: controller.sliderIndex,
                          activeDotColor: ColorManager.primaryColor,
                          inactiveDotColor: Colors.grey.shade300,
                        );
                  }),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: AppPadding.p24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PropertyHeader(model: controller.propertyDetails),
                      const SizedBox(height: AppSize.s24),
                      Text(
                        'المكتب المسؤول',
                        style: Get.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: AppSize.s12),
                      GestureDetector(
                        onDoubleTap:
                            () => Get.toNamed(
                              AppRoutes.officeDetails,
                              arguments:
                                  controller.propertyDetails.responsibleOffice,
                            ),
                        child: OfficeCardStyle2(
                          model: controller.propertyDetails.responsibleOffice,
                        ),
                      ),
                      PropertyDetailsWidget(model: controller.propertyDetails),
                      RoomDetailsWidget(
                        roomDetails: controller.propertyDetails.roomDetails,
                      ),
                      RelatedPropertiesWidgets(controller: controller),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: PriceSection(
        price: '\$30,000',
        onPressed: () {
          // Booking logic here
        },
      ),
    );
  }
}
//! kept them for their look 
// class FeaturesGrid extends StatelessWidget {
//   const FeaturesGrid({
//     super.key,
//     required this.features,
//     this.icon = const Icon(Icons.check_circle, size: 16, color: Colors.green),
//     this.crossAxisCount = 2,
//     this.childAspectRatio = 4,
//     this.crossAxisSpacing = 8,
//     this.mainAxisSpacing = 8,
//     this.backgroundColor = const Color(0xFFF0F0F0), // Light grey fallback
//     this.textStyle,
//   });

//   final List<String> features;
//   final Icon icon;
//   final int crossAxisCount;
//   final double childAspectRatio;
//   final double crossAxisSpacing;
//   final double mainAxisSpacing;
//   final Color backgroundColor;
//   final TextStyle? textStyle;

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: features.length,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: crossAxisCount,
//         childAspectRatio: childAspectRatio,
//         crossAxisSpacing: crossAxisSpacing,
//         mainAxisSpacing: mainAxisSpacing,
//       ),
//       itemBuilder: (context, index) {
//         return Container(
//           decoration: BoxDecoration(
//             color: backgroundColor,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           padding: const EdgeInsets.symmetric(horizontal: 12),
//           child: Row(
//             children: [
//               icon,
//               const SizedBox(width: 8),
//               Expanded(
//                 child: Text(
//                   features[index],
//                   style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }


// class InfoChip extends StatelessWidget {
//   final IconData icon;
//   final String text;

//   const InfoChip({super.key, required this.icon, required this.text});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(
//         horizontal: AppPadding.p12,
//         vertical: AppPadding.p8,
//       ),
//       decoration: BoxDecoration(
//         color: ColorManager.cardBack3,
//         borderRadius: BorderRadius.circular(AppSize.s12),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(icon, size: 16, color: ColorManager.primaryColor),
//           const SizedBox(width: AppSize.s4),
//           Text(text, style: Get.textTheme.bodySmall),
//         ],
//       ),
//     );
//   }
// }



// class ContactCard extends StatelessWidget {
//   final String phoneNumber;
//   final String name;

//   const ContactCard({super.key, required this.phoneNumber, required this.name});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: AppPadding.p16,
//           vertical: AppPadding.p8,
//         ),
//         child: Container(
//           padding: const EdgeInsets.all(AppPadding.p16),
//           decoration: BoxDecoration(
//             color: ColorManager.cardBackground,
//             borderRadius: BorderRadius.circular(AppSize.s12),
//             boxShadow: const [
//               BoxShadow(
//                 color: Colors.black12,
//                 blurRadius: 4,
//                 offset: Offset(0, 2),
//               ),
//             ],
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: Text(
//                   name,
//                   style: Get.textTheme.bodyLarge?.copyWith(
//                     fontWeight: FontWeight.bold,
//                     color: ColorManager.textColor1,
//                   ),
//                   textDirection: TextDirection.rtl,
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () => () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: ColorManager.primaryDark,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(AppSize.s12),
//                   ),
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: AppPadding.p16,
//                     vertical: AppPadding.p8,
//                   ),
//                 ),
//                 child: Row(
//                   children: [
//                     Text(
//                       phoneNumber,
//                       style: Get.textTheme.bodyMedium?.copyWith(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(width: AppSize.s8),
//                     Container(
//                       width: 28,
//                       height: 28,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Color(0xFF4ECDE6),
//                       ),
//                       child: const Icon(
//                         Icons.phone,
//                         color: Colors.white,
//                         size: 16,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
