import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/offices_page/widgets/office_card_style2.dart';
import 'package:property_ms/features/property_details/property_details_controller.dart';
import 'package:property_ms/features/property_details/widget/image_carousel.dart';
import 'package:property_ms/features/property_details/widget/property_details_widget.dart';
import 'package:property_ms/features/property_details/widget/property_header.dart';
import 'package:property_ms/features/property_details/widget/related_properties_widgets.dart';
import 'package:property_ms/features/property_details/widget/room_details_widget.dart';
import 'package:property_ms/features/widgets/price_section.dart';
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
                // pinned: true,
                elevation: 0,
                // backgroundColor: Colors.black,
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
                              controller.images
                                  .map((asset) => asset.provider())
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
                      const PropertyHeader(),
                      const SizedBox(height: AppSize.s24),
                      Text(
                        'المكتب المسؤول',
                        style: Get.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: AppSize.s12),
                      OfficeCardStyle2(model: controller.repsonsibleOffice),
                      const PropertyDetailsWidget(),
                      const RoomDetailsWidget(),
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

//! @OsamaZerkawi : kept them for their look 
// class FeaturesGrid extends StatelessWidget {
//   const FeaturesGrid({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final features = ["موقف سيارات", "حديقة", "مصعد", "انترنت", "تكييف", "أمن"];

//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: features.length,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 4,
//         crossAxisSpacing: 8,
//         mainAxisSpacing: 8,
//       ),
//       itemBuilder: (context, index) {
//         return Container(
//           decoration: BoxDecoration(
//             color: ColorManager.cardBack3,
//             borderRadius: BorderRadius.circular(AppSize.s8),
//           ),
//           padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
//           child: Row(
//             children: [
//               const Icon(
//                 Icons.check_circle,
//                 size: 16,
//                 color: ColorManager.greenColor,
//               ),
//               const SizedBox(width: AppSize.s8),
//               Text(features[index]),
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
