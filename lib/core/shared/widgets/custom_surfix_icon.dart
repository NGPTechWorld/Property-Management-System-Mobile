// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:rive/rive.dart';
// import 'package:svg_flutter/svg.dart';

// import '../../utils/constants/app_numbers.dart';

// class CustomSuffixIcon extends StatelessWidget {
//   const CustomSuffixIcon({
//     super.key,
//     required this.svgIcon,
//   });

//   final String svgIcon;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(
//         left: padding4 * 5,
//         right: padding4 * 5,
//         top: padding4 * 4,
//         bottom: padding4 * 4,
//       ),
//       child: SvgPicture.asset(
//         svgIcon,
//       ),
//     );
//   }
// }

// class CustomAnimatedLockIcon extends StatefulWidget {
//   const CustomAnimatedLockIcon({
//     super.key,
//     required this.artboard,
//   });

//   final Artboard? artboard;

//   @override
//   State<CustomAnimatedLockIcon> createState() => _CustomAnimatedLockIconState();
// }

// class _CustomAnimatedLockIconState extends State<CustomAnimatedLockIcon> {
//   @override
//   Widget build(BuildContext context) {
//     log("rebuild lock icon");
//     return Container(
//       margin: const EdgeInsets.only(
//         left: padding4 * 3,
//         right: padding4 * 3,
//         top: padding4 * 3,
//         bottom: padding4 * 3,
//       ),
//       child: widget.artboard == null
//           ? const CircularProgressIndicator()
//           : SizedBox(
//               width: 100,
//               height: 100,
//               child: Rive(artboard: (widget.artboard)!),
//             ),
//     );
//   }
// }
