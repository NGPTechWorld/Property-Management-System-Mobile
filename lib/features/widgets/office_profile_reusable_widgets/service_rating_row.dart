import 'package:flutter/material.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/info_card.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/rating_card.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/service_type_chip.dart';

class ServiceRatingRow extends StatelessWidget {
  const ServiceRatingRow({
    super.key,
    required this.serviceType,
    required this.rate,
    required this.onRatingChanged,
  });

  final String serviceType;
  final String rate;
  final ValueChanged<double> onRatingChanged;

  @override
  Widget build(BuildContext context) {
    final double parsedRate = double.tryParse(rate) ?? 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InfoCard(
          title: 'نوع الخدمة',
          child: ServiceTypeChip(label: serviceType),
        ),
        const SizedBox(width: AppSize.s16),
        RatingCard(rate: parsedRate, onRatingChanged: onRatingChanged),
      ],
    );
  }
}
