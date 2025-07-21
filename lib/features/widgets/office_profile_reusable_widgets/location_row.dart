import 'package:flutter/material.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/lacation_card.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/map_button.dart';

class LocationRow extends StatelessWidget {
  const LocationRow({super.key, required this.location});
  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [LocationCard(location: location), const MapButton()],
    );
  }
}
