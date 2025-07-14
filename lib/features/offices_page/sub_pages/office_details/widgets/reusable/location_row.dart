import 'package:flutter/material.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/lacation_card.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/map_button.dart';

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
