import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/info_card.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/service_type_chip.dart';

class ServiceRatingRow extends StatelessWidget {
  const ServiceRatingRow({
    super.key,
    required this.serviceType,
    required this.rate,
  });

  final String serviceType;
  final String rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InfoCard(
          title: 'نوع الخدمة',
          child: ServiceTypeChip(label: serviceType),
        ),
        const SizedBox(width: AppSize.s16),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder:
              //! @OsamaZerkawi should the rating for servie && office
                  (_) => AlertDialog(
                    title: const Text('أضف تقييمك'),
                    content: RatingBar.builder(
                      initialRating: double.tryParse(rate) ?? 0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder:
                          (context, _) =>
                              const Icon(Icons.star, color: Colors.amber),
                      onRatingUpdate: (rating) {
                        print('New rating: $rating');
                      },
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('إغلاق'),
                      ),
                    ],
                  ),
            );
          },
          child: InfoCard(
            title: 'التقييم',
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  rate,
                  style: TextStyle(
                    fontSize: FontSize.s20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF3F3D56),
                  ),
                ),
                const SizedBox(width: 6),
                const Icon(Icons.star, color: Colors.amber, size: AppSize.s24),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
