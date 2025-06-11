// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';

// class Skeleton extends StatelessWidget {
//   const Skeleton({
//     super.key,
//     this.width,
//     this.height,
//     this.radius,
//     this.margin,
//   });
//   final EdgeInsets? margin;
//   final double? width, height, radius;
//   @override
//   Widget build(BuildContext context) {
//     final baseColor = Theme.of(context).colorScheme.surface;
//     final highLightColor = Theme.of(context).colorScheme.surfaceContainerLow;
//     return Shimmer.fromColors(
//       baseColor: baseColor,
//       highlightColor: highLightColor,
//       child: Container(
//         margin: margin,
//         width: width,
//         height: height,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(radius!),
//           color: baseColor,
//         ),
//       ),
//     );
//   }
// }
