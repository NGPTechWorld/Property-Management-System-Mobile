import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/info_card.dart';

class RatingCard extends StatelessWidget {
  const RatingCard({
    super.key,
    required this.rate,
    required this.onRatingChanged,
  });

  final double rate;
  final ValueChanged<double> onRatingChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder:
              (_) => RatingDialog(
                initialRate: rate,
                onRatingUpdate: (newRating) {
                  onRatingChanged(newRating);
                  Navigator.of(context).pop();
                },
              ),
        );
      },
      child: InfoCard(
        title: 'التقييم',
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              rate.toStringAsFixed(1),
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
    );
  }
}

class RatingDialog extends StatelessWidget {
  const RatingDialog({
    super.key,
    required this.initialRate,
    required this.onRatingUpdate,
  });

  final double initialRate;
  final ValueChanged<double> onRatingUpdate;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('أضف تقييمك'),
      content: RatingBar.builder(
        initialRating: initialRate,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder:
            (context, _) => const Icon(Icons.star, color: Colors.amber),
        onRatingUpdate: onRatingUpdate,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('إغلاق'),
        ),
      ],
    );
  }
}
