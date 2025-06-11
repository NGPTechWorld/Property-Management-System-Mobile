// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

// class AnimatedAdaptiveGridLayout extends StatelessWidget {
//   final int itemCount;
//   final Widget Function(BuildContext context, int index) itemBuilder;
//   final double spacing;
//   final EdgeInsetsGeometry padding;
//   final double rowHeight;

//   const AnimatedAdaptiveGridLayout({
//     super.key,
//     required this.itemCount,
//     required this.itemBuilder,
//     this.spacing = 8.0,
//     this.padding = EdgeInsets.zero,
//     this.rowHeight = 120.0,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         // final width = constraints.maxWidth;
//         final count = itemCount;

//         // Calculate columns based on number of items
//         int columns;
//         if (count <= 4) {
//           columns = count > 0 ? count : 1;
//         } else {
//           // For 5 or more items, we use 4 columns
//           columns = 4;
//         }

//         // For 1-4 items, use a different grid layout
//         if (count <= 4) {
//           return CustomScrollView(
//             slivers: [
//               SliverPadding(
//                 padding: padding,
//                 sliver: SliverGrid(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: columns,
//                     mainAxisExtent: rowHeight,
//                     crossAxisSpacing: spacing,
//                     mainAxisSpacing: spacing,
//                   ),
//                   delegate: SliverChildBuilderDelegate(
//                     (context, index) {
//                       return AnimationConfiguration.staggeredGrid(
//                         position: index,
//                         duration: const Duration(milliseconds: 375),
//                         columnCount: columns,
//                         child: ScaleAnimation(
//                           child: FadeInAnimation(
//                             child: itemBuilder(context, index),
//                           ),
//                         ),
//                       );
//                     },
//                     childCount: count,
//                   ),
//                 ),
//               ),
//             ],
//           );
//         } else {
//           // For 5+ items, use a 4-column grid
//           return CustomScrollView(
//             slivers: [
//               SliverPadding(
//                 padding: padding,
//                 sliver: SliverGrid(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 4,
//                     mainAxisExtent: rowHeight,
//                     crossAxisSpacing: spacing,
//                     mainAxisSpacing: spacing,
//                   ),
//                   delegate: SliverChildBuilderDelegate(
//                    (context, index) {
//                       return AnimationConfiguration.staggeredGrid(
//                         position: index,
//                         duration: const Duration(milliseconds: 375),
//                         columnCount: columns,
//                         child: ScaleAnimation(
//                           child: FadeInAnimation(
//                             child: itemBuilder(context, index),
//                           ),
//                         ),
//                       );
//                     },
//                     childCount: count,
//                   ),
//                 ),
//               ),
//             ],
//           );
//         }
//       },
//     );
//   }
// }

// // Example usage:
// class AdaptiveGridExample extends StatefulWidget {
//   const AdaptiveGridExample({super.key});

//   @override
//   State<AdaptiveGridExample> createState() => _AdaptiveGridExampleState();
// }

// class _AdaptiveGridExampleState extends State<AdaptiveGridExample> {
//   int itemCount = 1;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Adaptive Grid Layout'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       if (itemCount > 1) itemCount--;
//                     });
//                   },
//                   child: const Text('Remove Item'),
//                 ),
//                 const SizedBox(width: 16),
//                 Text('Items: $itemCount', style: const TextStyle(fontSize: 18)),
//                 const SizedBox(width: 16),
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       itemCount++;
//                     });
//                   },
//                   child: const Text('Add Item'),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: AnimatedAdaptiveGridLayout(
//                 spacing: 12.0,
//                 rowHeight: 100.0,
//                 itemCount: itemCount,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     decoration: BoxDecoration(
//                       color: Colors.blue.shade200,
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     alignment: Alignment.center,
//                     // child: Text(
//                     //   'Item ${index + 1}',
//                     //   style: const TextStyle(fontSize: 18),
//                     // ),
//                     child: Icon(Icons.home),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
