import 'package:flutter/material.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/helper/app_functions.dart';
import 'package:property_ms/core/utils/values_manager.dart';

class ContactCard extends StatelessWidget {
  final String phoneNumber;
  final String name;

  const ContactCard({super.key, required this.phoneNumber, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.cardBack3,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: AppSize.s8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 16,
              ),
              textDirection: TextDirection.rtl,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          GestureDetector(
            onTap: () => AppFunctions.callPhoneNumber(phoneNumber),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1C4D65), // dark blue background
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Row(
                children: [
                  Text(
                    phoneNumber,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: AppSize.s8),
                  Container(
                    width: 28,
                    height: 28,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF4ECDE6),
                    ),
                    child: const Icon(
                      Icons.phone,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
